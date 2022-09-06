//
// Created by os on 8/30/22.
//

#include "../h/_sem.hpp"

void lock(){
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
}
void unlock(){
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}

_sem::~_sem() {
    lock();
    _thread *t;
    t = blockedThreadQueue.removeLast();
    while(t){
        Scheduler::put(t);
        t = blockedThreadQueue.removeLast();
    }
    unlock();
}

void _sem::block() {

    _thread::running->blocked  = true;
    _thread::running->blockedBy = this;
    _thread::yield();
    //pozvace se zamena konteksta, ako je blocked = true u dispach()-u ce se ubaciti nit u blocked que

}

void _sem::deblock(){
    _thread *t = blockedThreadQueue.removeFirst();
    Scheduler::put(t);
}

void _sem::wait() {
    lock();
    if(--val < 0)
        block();
    unlock();
}

void _sem::signal() {
    lock();
    if(val++ < 0)
        deblock();
    unlock();
}

List<_thread>& _sem::blockedList(){
    return _sem::blockedThreadQueue;
}


