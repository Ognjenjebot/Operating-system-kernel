//
// Created by marko on 20.4.22..
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP

#include "syscall_c.h"
#include "../lib/hw.h"
#include "scheduler.hpp"

// Thread Control Block
class _thread
{
public:
    ~_thread() { mem_free(stack); }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    using Body = void (*)();

    //mickov poziv, i poziv za projekat
    static _thread *createThread(Body body);
    static int createThread(thread_t*, Body, void*, void*);

    static void yield();

    static _thread *running;

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
        if (body != nullptr) { Scheduler::put(this); }
    }



    _thread(Body body, void *args, void *stack) :
            body(body),
            stack(body != nullptr ? (uint64*)stack : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) stack : 0
                    }),
            args(args),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false)
    {
        if (body != nullptr) {
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
    void* args;     //prosledjuju se pri kreiranju

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    static int threadStop();

    static uint64 timeSliceCounter;

    static uint64 constexpr STACK_SIZE = 1024;
    static uint64 constexpr TIME_SLICE = 2;
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
