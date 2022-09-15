//
// Created by marko on 20.4.22..
//

#include "../h/tcb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"


int main()
{
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    _thread *threads[5];

    threads[0] = _thread::createThread(nullptr);
    _thread::running = threads[0];
    if(Riscv::buff2.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    }
//    thread_create(&threads[1], &workerBodyA, nullptr);
//    threads[1] = _thread::createThread(workerBodyA);
    thread_create(&threads[1], workerBodyA, nullptr);
    printString("ThreadA created\n");
    threads[2] = _thread::createThread(&_thread::consoleWrite);
//    threads[2] = _thread::createThread(workerBodyB);
//    printString("ThreadB created\n");
//    threads[3] = _thread::createThread(workerBodyC);
//    printString("ThreadC created\n");
////    threads[4] = _thread::createThread(workerBodyD);
////    printString("ThreadD created\n");
//

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
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
    while (!(threads[0]->isFinished() && threads[1]->isFinished() && threads[2]->isFinished()))
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
