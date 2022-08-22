//
// Created by marko on 20.4.22..
//

#include "../h/tcb.hpp"
#include "../h/riscv.hpp"

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    return new _thread(body, TIME_SLICE);
}
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack)
{
    *handle = new _thread(body, args, stack);
    if(*handle != nullptr)
        return 0;
    else
        return -2;
}

void _thread::yield()
{
    __asm__ volatile ("ecall");
}

void _thread::dispatch()
{
    _thread *old = running;
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    Riscv::popSppSpie();
    running->body();
    running->setFinished(true);
    _thread::yield();
}

int _thread::threadStop(){
    running->setFinished(true);
    if(mem_free(running->stack) != 0)
        return -3;
    else
        _thread::yield();
}