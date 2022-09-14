//
// Created by marko on 20.4.22..
//

#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/print.hpp"
#include "../lib/mem.h"

//zasto se ne uvozi body iz tcb.hpp???(using vazi samo za fajl u kom je definisan?)
using Body = void (*)();
List<_thread> Riscv::sleepingThreads;
KeyboardBuffer Riscv::buff1, Riscv::buff2;
char Riscv::ttt;

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::handleSupervisorTrap()
{
    uint64 scause = r_scause();

    int ret = 0;

    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    {
        // interrupt: no; cause code: environment call from U-mode(8) or S-mode(9)
        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();
        uint64  code;
        __asm__ volatile("mv %0, a0" : "=r" (code));

        if(code == 0x1) {
            //MEM_ALLOC
            //poslat je poravnati broj blokova, ali se opet mora izraziti u bajtovima velicina memorije
            uint64 x;
            __asm__ volatile("mv %0, a1" : "=r" (x));
            x *= MEM_BLOCK_SIZE;
            void* r = __mem_alloc(x);
            //povratna vrednost
            __asm__ volatile("mv a0, %0" : : "r" (r));
        }else if(code == 0x02) {
            //MEM_FREE
            uint64 ret;
            uint64 x;
            __asm__ volatile("mv %0, a1" : "=r" (x));
            ret = __mem_free((void*)x);
            __asm__ volatile("mv a0, %0" : : "r" (ret));
        }else if(code == 0x11){
            //THREAD_CREATE
            thread_t *handle;
            Body body;
            void* args;
            void* stack;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            __asm__ volatile("mv %0, a2" : "=r" (body));
//            __asm__ volatile("mv %0, a3" : "=r" (args));
//            __asm__ volatile("mv %0, a4" : "=r" (stack));

            //vrednosti registara a3 i a4 se pobrkaju skroz, pa cu  njih uzeti sa steka

            //radi sa fp umesto sp, nzm zasto, proveriti posle
            __asm__ volatile("ld t2, 104(fp)");
            __asm__ volatile("ld t3, 112(fp)");

            __asm__ volatile("mv %0, t2" : "=r" (args));
            __asm__ volatile("mv %0, t3" : "=r" (stack));
            printInteger((uint64)stack);
            int ret = _thread::createThread(handle, body, args, stack);
            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(code == 0x12){
            //THREAD_EXIT
            int ret = _thread::threadStop();
            if(ret != 0)
                __asm__ volatile("mv a0, %0" : : "r" (ret));
            else
                __asm__ volatile("mv a0, zero");
        }else if(code == 0x13){
            //THREAD_DISPACH

        }else if(code == 0x21){
            //SEM_OPEN
            sem_t *handle;
            uint64 init;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            __asm__ volatile("mv %0, a2" : "=r" (init));
            int ret = _sem::createSem(handle, init);
            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(code == 0x22){
            //SEM_CLOSE
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            delete handle; //TODO ??????????????????????????????????????
            int ret = 0;
            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(code == 0x23){
            //SEM_WAIT
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            int ret = handle->wait(); //TODO ?????????;
            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(code == 0x24){
            //SEM_SIGNAL
            sem_t id;
            __asm__ volatile("mv %0, a1" : "=r" (id));
            int ret = id->signal();
            __asm__ volatile("mv a0, %0" : : "r" (ret));
        }else if(code == 0x31){
            //TIME_SLEEP
            time_t time;
            __asm__ volatile("mv %0, a1" : "=r" (time));
            int ret = _thread::sleep(time);
            __asm__ volatile("mv a0, %0" : : "r" (ret));

        }else if(code == 0x41){
            //GETC
            ret = buff2.take();

        }else if(code == 0x42){
            //PUTC
            char c;
            __asm__ volatile("mv %0, a1" : "=r" (c));
//            *((char*)CONSOLE_TX_DATA) = c;
            buff1.append(c);

        }else{
            _thread::timeSliceCounter = 0;
            _thread::dispatch();
        }

        w_sstatus(sstatus);
        w_sepc(sepc);
        __asm__ volatile("mv a0, %0" : : "r" (ret));
    }
    else if (scause == 0x8000000000000001UL)
    {
        // interrupt: yes; cause code: supervisor software interrupt (CLINT; machine timer interrupt)
        Riscv::sleepingThreads.sleepControl();  //budi uspaavane niti ako je dosao red na njih
        mc_sip(SIP_SSIP);
        _thread::timeSliceCounter++;
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
        {
            uint64 volatile sepc = r_sepc();
            uint64 volatile sstatus = r_sstatus();
            _thread::timeSliceCounter = 0;
            _thread::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
    }
    else if (scause == 0x8000000000000009UL) {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
//        console_handler();
        static int IRQ_CONSOLE = 10;
        int irq = plic_claim();
        if (irq == IRQ_CONSOLE)
        {
            //pomeriti kasnije inicijalizaciju negde drugde(main npr.)

            //NE CUVATI CONSOLE_STATUS U LOKALNOJ PROMNLJIVOJ JER NE RADI IZ NEKOG RAZLOGA!!!!
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
                __asm__ volatile("mv a1, %0" : : "r" (*((char*)CONSOLE_STATUS)));
                char c = (*(char*)CONSOLE_RX_DATA);
                buff2.append(c);
//                c = c;
//                __asm__ volatile("mv a2, %0" : : "r" (c));
//                ttt = 'e';
//                buff1.append((*(char*)CONSOLE_RX_DATA));  ne radi direktno??????, mora prvo u promenljivu da se stavi
//                buff1.append(c);
            }
        }
        plic_complete(irq);
    }
        else
    {
        // unexpected trap cause
    }
}