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
    _thread *threads[5];

    threads[0] = _thread::createThread(nullptr);
    _thread::running = threads[0];

    threads[1] = _thread::createThread(workerBodyA);
    printString("ThreadA created\n");
    threads[2] = _thread::createThread(workerBodyB);
    printString("ThreadB created\n");
    threads[3] = _thread::createThread(workerBodyC);
    printString("ThreadC created\n");
//    threads[4] = _thread::createThread(workerBodyD);
//    printString("ThreadD created\n");

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    int ret = thread_create(&threads[4], reinterpret_cast<void (*)(void *)>(workerBodyD), nullptr);
    printString("ThreadD created\n");
    printInteger(ret);

    while (!(threads[1]->isFinished() &&
             threads[2]->isFinished() &&
             threads[3]->isFinished() &&
             threads[4]->isFinished()))
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
