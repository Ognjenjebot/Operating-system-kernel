//
// Created by marko on 20.4.22..
//

#include "../h/scheduler.hpp"

List<_thread> Scheduler::readyThreadQueue;

_thread *Scheduler::get()
{
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
}