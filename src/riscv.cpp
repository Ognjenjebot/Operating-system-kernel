//
// Created by marko on 20.4.22..
//

#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../lib/console.h"
#include "../h/print.hpp"
#include "../lib/mem.h"

//zasto se ne uvozi body iz tcb.hpp???(using vazi samo za fajl u kom je definisan?)
using Body = void (*)();

void Riscv::popSppSpie()
{
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::handleSupervisorTrap()
{
    uint64 scause = r_scause();

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
            uint64 *r = (uint64 *) __mem_alloc(x);
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
            __asm__ volatile("mv %0, a3" : "=r" (args));
            __asm__ volatile("mv %0, a4" : "=r" (stack));

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

        }else if(code == 0x22){
            //SEM_CLOSE

        }else if(code == 0x23){
            //SEM_WAIT

        }else if(code == 0x24){
            //SEM_SIGNAL

        }else if(code == 0x31){
            //TIME_SLEEP

        }else if(code == 0x41){
            //GETC

        }else if(code == 0x42){
            //PUTC

        }else{
            _thread::timeSliceCounter = 0;
            _thread::dispatch();
        }

        w_sstatus(sstatus);
        w_sepc(sepc);
    }
    else if (scause == 0x8000000000000001UL)
    {
        // interrupt: yes; cause code: supervisor software interrupt (CLINT; machine timer interrupt)
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
    else if (scause == 0x8000000000000009UL)
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    }
    else
    {
        // unexpected trap cause
    }
}