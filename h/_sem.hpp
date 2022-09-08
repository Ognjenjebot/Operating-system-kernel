//
// Created by os on 8/30/22.
//

#ifndef PROJECT_BASE__SEM_HPP
#define PROJECT_BASE__SEM_HPP

#include "list.hpp"
#include "tcb.hpp"
#include "riscv.hpp"


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


private:
    _sem(int val=1) : val(val) {}
    void block();
    void deblock();

    int val;

    List<_thread> blockedThreadQueue;

};

#endif //PROJECT_BASE__SEM_HPP
