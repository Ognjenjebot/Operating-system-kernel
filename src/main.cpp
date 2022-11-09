//
// Created by marko on 20.4.22..
//

#include "../h/tcb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"

bool finishedd = false;
extern void userMain();

void wrp(void *t){
//    printStringO("userMain()");
    userMain();
//    printStringO("gotovo");
    finishedd = true;
}

int main()
{
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

//    thread_t main, console, user;
    _thread *threads[3];
    thread_create(&threads[1], &_thread::consoleWrite, nullptr);
    thread_create(&threads[0], nullptr, nullptr);
    _thread::running = threads[0];

    if(Riscv::buff2.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    }
//    thread_create(&main, nullptr, nullptr);
//    thread_create(&console, &_thread::consoleWrite, nullptr);
//
//    thread_create(&user, wrp, nullptr);




    thread_create(&threads[2], wrp, nullptr);


    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!finishedd)
    {
        thread_dispatch();
    }

    printStringO("Finished\n");

    return 0;
}

//int main()
//{
//    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
//    _thread *threads[5];
//
////    threads[0] = _thread::createThread(nullptr);
//    thread_create(&threads[0], nullptr, nullptr);
//    _thread::running = threads[0];
//    if(Riscv::buff2.itemAvailable == nullptr){
//        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
//    }
//    if(Riscv::buff1.itemAvailable == nullptr){
//        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
//    }
////    thread_create(&threads[1], &workerBodyA, nullptr);
////    threads[1] = _thread::createThread(workerBodyA);
//    thread_create(&threads[1], workerBodyAA, nullptr);
//    printStringO("ThreadA created\n");
////    threads[2] = _thread::createThread(&_thread::consoleWrite);
//    thread_create(&threads[2], &_thread::consoleWrite, nullptr);
//
//
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
////    int ret = thread_create(&threads[4], reinterpret_cast<void (*)(void *)>(workerBodyD), nullptr);
////    printString("ThreadD created\n");
////    printInteger(ret);
//
//
//    while (!(threads[0]->isFinished() && threads[1]->isFinished() && threads[2]->isFinished()))
//    {
////        _thread::yield();
//        thread_dispatch();
//    }
//    printStringO("test");
//    //DODATI DELETE I NEW!!!
//    for (auto &thread: threads)
//    {
//        delete thread;
//    }
//    printStringO("Finished\n");
//
//    return 0;
//}
