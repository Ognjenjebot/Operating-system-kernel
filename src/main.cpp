//
// Created by marko on 20.4.22..
//

#include "../h/tcb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"



bool finishedTastatura = false;
void TastaturaWorker(void* arg) {
//    printString("dosa ovdee2!");
    for (uint64 i = 0; i < 16; i++) {

//        printString("Tastatura: i=");
//        printInteger(i);
//        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            _thread::yield();
        }
    }
//    printString("dosa ovdee!");
    int count = Riscv::buff2.getCount();
    while (count >= 0){
        --count;
        char x = getc();
        putc(x);
    }
    printString("\nTastatura finished!\n");
    finishedTastatura = true;

}
void tastaturaTest(){
    __attribute__((unused)) _thread *Tastatura;
    Tastatura = _thread::createThread(TastaturaWorker);
    printString("Tastatura created\n");

    while (!finishedTastatura) {
        _thread::yield();
    }
}

void userMain() {
//    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
//    testSleeping();       // ThreadSleeping test
    tastaturaTest();
}

int main()
{
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    _thread *threads[5];

    threads[0] = _thread::createThread(&_thread::consoleWrite);
    threads[1] = _thread::createThread(nullptr);
    _thread::running = threads[1];
    if(Riscv::buff2.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    }
//    threads[1] = _thread::createThread(workerBodyA);
//    printString("ThreadA created\n");

//    threads[2] = _thread::createThread(workerBodyB);
//    printString("ThreadB created\n");
//    threads[3] = _thread::createThread(workerBodyC);
//    printString("ThreadC created\n");
////    threads[4] = _thread::createThread(workerBodyD);
////    printString("ThreadD created\n");
//

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    userMain();
//    int ret = thread_create(&threads[4], reinterpret_cast<void (*)(void *)>(workerBodyD), nullptr);
//    printString("ThreadD created\n");
//    printInteger(ret);

//    while (!(threads[1]->isFinished() &&
//             threads[2]->isFinished() &&
//             threads[3]->isFinished() &&
//             threads[4]->isFinished()))
//    {
//        _thread::yield();
//    }
    while (!(threads[1]->isFinished() && threads[2]->isFinished()))
    {
        _thread::yield();
    }
    printString("test");
    //DODATI DELETE I NEW!!!
    for (auto &thread: threads)
    {
        delete thread;
    }
    printString("Finished\n");

    return 0;
}





//int main()
//{
//    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
//    _thread *threads[5];
//
//    threads[0] = _thread::createThread(nullptr);
//    _thread::running = threads[0];
//    if(Riscv::buff2.itemAvailable == nullptr){
//        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
//    }
//    if(Riscv::buff1.itemAvailable == nullptr){
//        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
//    }
//    threads[1] = _thread::createThread(workerBodyA);
//    printString("ThreadA created\n");
//    threads[2] = _thread::createThread(&_thread::consoleWrite);
////    threads[2] = _thread::createThread(workerBodyB);
////    printString("ThreadB created\n");
////    threads[3] = _thread::createThread(workerBodyC);
////    printString("ThreadC created\n");
//////    threads[4] = _thread::createThread(workerBodyD);
//////    printString("ThreadD created\n");
////
//
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
////    int ret = thread_create(&threads[4], reinterpret_cast<void (*)(void *)>(workerBodyD), nullptr);
////    printString("ThreadD created\n");
////    printInteger(ret);
//
////    while (!(threads[1]->isFinished() &&
////             threads[2]->isFinished() &&
////             threads[3]->isFinished() &&
////             threads[4]->isFinished()))
////    {
////        _thread::yield();
////    }
//    while (!(threads[1]->isFinished() && threads[2]->isFinished()))
//    {
//        _thread::yield();
//    }
//    printString("test");
//    //DODATI DELETE I NEW!!!
//    for (auto &thread: threads)
//    {
//        delete thread;
//    }
//    printString("Finished\n");
//
//    return 0;
//}
