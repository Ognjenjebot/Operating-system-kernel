//
// Created by os on 8/30/22.
//

#ifndef PROJECT_BASE__SEM_HPP
#define PROJECT_BASE__SEM_HPP

#include "list.hpp"
#include "tcb.hpp"
//#include "syscall_c.h"
#include "scheduler.hpp"


class _sem{

public:
    static int createSem(sem_t*, uint64);
    ~_sem();

    int wait();
    int signal();

    int value(){
        return val;
    }
    friend class _thread;
    List<_thread>& blockedList();


    _sem(int val=1) : val(val) {}

private:
    void block();
    void deblock();
    friend class _buffer;

    int val;

    List<_thread> blockedThreadQueue;

};

#endif //PROJECT_BASE__SEM_HPP
