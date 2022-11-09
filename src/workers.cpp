//
// Created by marko on 20.4.22..
//

#include "../lib/hw.h"
#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../h/syscall_c.h"
#include "../h/riscv.hpp"

void workerBodyAA(void* args)
{
    for (uint64 i = 0; i < 10; i++)
    {
        if(i == 5) {
            time_sleep(50);
//            putc(Riscv::ttt);
//            while(true)
//                putc(Riscv::buff2.take());
//            putc('o');
//            putc('a');
//            putc('b');
//            putc('v');
//            putc('d');
//            putc('c');
//            putc('q');

            char c = getc();
            putc(c);
        }
        printStringO("A: i=");
        printInteger(i);
        printStringO("\n");
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
//    time_sleep(50);
}

void workerBodyBB(void*)
{
    for (uint64 i = 0; i < 16; i++)
    {
        printStringO("B: i=");
        printInteger(i);
        printStringO("\n");
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

void workerBodyCC(void*)
{
    uint8 i = 0;
    for (; i < 3; i++)
    {
        printStringO("C: i=");
        printInteger(i);
        printStringO("\n");
    }

    printStringO("C: yield\n");
    __asm__ ("li t1, 7");
    _thread::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printStringO("C: t1=");
    printInteger(t1);
    printStringO("\n");

    uint64 result = fibonacci(12);
    printStringO("C: fibonaci=");
    printInteger(result);
    printStringO("\n");

    for (; i < 6; i++)
    {
        printStringO("C: i=");
        printInteger(i);
        printStringO("\n");
    }
//    _thread::yield();
}

void workerBodyDD(void*)
{
    uint8 i = 10;
    for (; i < 13; i++)
    {
        printStringO("D: i=");
        printInteger(i);
        printStringO("\n");
    }

    printStringO("D: yield\n");
    __asm__ ("li t1, 5");
    _thread::yield();

    uint64 result = fibonacci(16);
    printStringO("D: fibonaci=");
    printInteger(result);
    printStringO("\n");

    for (; i < 16; i++)
    {
        printStringO("D: i=");
        printInteger(i);
        printStringO("\n");
    }
//    _thread::yield();
}