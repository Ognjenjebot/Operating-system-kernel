//
// Created by marko on 20.4.22..
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP

#include "syscall_c.h"
#include "../lib/hw.h"
#include "scheduler.hpp"
#include "../h/print.hpp"
#include "_sem.hpp"

// Thread Control Block

class _thread
{
public:
    ~_thread() { delete[] stack; }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    void setSleep();

    void insertScheduler() {
        Scheduler::put(this);
    }

    void dblck();

    void start() { Scheduler::put(this); }

    using Body = void (*)(void*);

    //mickov poziv, i poziv za projekat
    static _thread *createThread(Body body);
    static int createThread(thread_t*, Body, void*, void*, bool);

    static void yield();

    static _thread *running;

    static void consoleWrite(void*);
    static void idleDeletion();
    static void dispatch();

private:
    //mickov konstruktor
    _thread(Body body, uint64 timeSlice) :
            body(body),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    {
        if (body != nullptr) { Scheduler::put(this);}
    }



    _thread(Body body, void *args, void *stackk, bool t) :
            body(body),
            stack(body != nullptr ? (uint64*)stackk : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    {
        if (body != nullptr) {
            if(t)
                Scheduler::put(this);
        }
    }

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;
    Context context;
    uint64 timeSlice;
    bool finished;
    void* args = nullptr;     //prosledjuju se pri kreiranju
    bool blocked = false;
    bool sleeping = false;
    _sem *blockedBy = nullptr;
    friend class _sem;
    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

//

    static int threadStop();

    static int sleep(time_t);

    static uint64 timeSliceCounter;

    static uint64 constexpr STACK_SIZE = 1024;
    static uint64 constexpr TIME_SLICE = 2;
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
