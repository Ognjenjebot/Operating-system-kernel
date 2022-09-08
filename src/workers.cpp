//
// Created by marko on 20.4.22..
//

#include "../lib/hw.h"
#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../h/syscall_c.h"

void workerBodyA()
{
    for (uint64 i = 0; i < 10; i++)
    {
        printString("A: i=");
        printInteger(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++)
        {
            for (uint64 k = 0; k < 30000; k++)
            {
                // busy wait
            }
//            _thread::yield();
        }
    }
//    void* p = mem_alloc(4096);
//    printString("stigao do dealokacije\n");
//    printInteger((uint64)p);
//    if(mem_free(p) == 0)
//        printString("USPESNO OSLOBODJENA MEMORIJA!");
//    else
//        printString("NEUSPESNO OSLOBODJENA MEMORIJA");
    time_sleep(500);
}

void workerBodyB()
{
    for (uint64 i = 0; i < 16; i++)
    {
        printString("B: i=");
        printInteger(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++)
        {
            for (uint64 k = 0; k < 30000; k++)
            {
                // busy wait
            }
//            _thread::yield();
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { _thread::yield(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyC()
{
    uint8 i = 0;
    for (; i < 3; i++)
    {
        printString("C: i=");
        printInteger(i);
        printString("\n");
    }

    printString("C: yield\n");
    __asm__ ("li t1, 7");
    _thread::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printString("C: t1=");
    printInteger(t1);
    printString("\n");

    uint64 result = fibonacci(12);
    printString("C: fibonaci=");
    printInteger(result);
    printString("\n");

    for (; i < 6; i++)
    {
        printString("C: i=");
        printInteger(i);
        printString("\n");
    }
//    _thread::yield();
}

void workerBodyD()
{
    uint8 i = 10;
    for (; i < 13; i++)
    {
        printString("D: i=");
        printInteger(i);
        printString("\n");
    }

    printString("D: yield\n");
    __asm__ ("li t1, 5");
    _thread::yield();

    uint64 result = fibonacci(16);
    printString("D: fibonaci=");
    printInteger(result);
    printString("\n");

    for (; i < 16; i++)
    {
        printString("D: i=");
        printInteger(i);
        printString("\n");
    }
//    _thread::yield();
}