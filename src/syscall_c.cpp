//
// Created by os on 8/12/22.
//

#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/syscall_codes.h"
#include "../h/print.hpp"

void syscall(){
    __asm__ volatile("ecall");
}

void setArgs(){

}

//pakovanje poziva sa argumentima

void* mem_alloc(size_t size){
    uint64 volatile blocksNum;
    if(size % MEM_BLOCK_SIZE != 0) {
        blocksNum = size / MEM_BLOCK_SIZE + 1;
    }
    else {
        blocksNum = size / MEM_BLOCK_SIZE;
    }
    __asm__ volatile("mv a0, %0" : : "r" (MEM_ALLOC));
    __asm__ volatile("mv a1, %0" : : "r" (blocksNum));
    __asm__ volatile("ecall");
    //poziv za blockNum
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
//    printString("povratak iz prekidne rutine\n");
//    printInteger((uint64)ret);
    return (void*)ret;
}

int mem_free(void *p){

    __asm__ volatile("mv a0, %0" : : "r" (MEM_FREE));
    __asm__ volatile("mv a1, %0" : : "r" (p));

    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int thread_create( thread_t* handle,
                   void(*start_routine)(void*),
                   void *arg
                   ){
    //za ABI poziv mora se dodati i argument za stek

    void* stack = (mem_alloc(DEFAULT_STACK_SIZE));
    if(stack != nullptr) {
        __asm__ volatile("mv a0, %0" : : "r" (THREAD_CREATE));
        __asm__ volatile("mv a1, %0" : : "r" (handle));
        __asm__ volatile("mv a2, %0" : : "r" (start_routine));
        __asm__ volatile("mv a3, %0" : : "r" (arg));
        __asm__ volatile("mv a4, %0" : : "r" (stack));
        __asm__ volatile("ecall");

        uint64 ret;
        __asm__ volatile("mv %0, a0" : "=r" (ret));
        return ret;

    } else{
        return -2;
    }
}

int thread_exit(){
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_EXIT));
    __asm__ volatile("ecall");
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}




