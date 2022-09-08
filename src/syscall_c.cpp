//
// Created by os on 8/12/22.
//

#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/syscall_codes.h"
#include "../h/print.hpp"
#include "../h/tcb.hpp"

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
    //prvo cu upisati p u a1, jer ako stavim prvo da se upise vrednost u a0 promenicu i argumen p
    //jer je preko njega poslat argument f-je
    __asm__ volatile("mv a1, %0" : : "r" (p));
    __asm__ volatile("mv a0, %0" : : "r" (MEM_FREE));

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

    void* volatile stack = new uint64[1024];
    printInteger((uint64)stack);
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

int sem_open(sem_t *handle, unsigned init){
    __asm__ volatile("mv a2, %0" : : "r" (init));
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    __asm__ volatile("mv a0, %0" : : "r" (SEM_OPEN));
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int sem_close(sem_t handle){
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    __asm__ volatile("mv a0, %0" : : "r" (SEM_CLOSE));
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int sem_wait(sem_t id){
    __asm__ volatile("mv a1, %0" : : "r" (id));
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int sem_signal(sem_t id){
    __asm__ volatile("mv a1, %0" : : "r" (id));
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}

int time_sleep(time_t t){
    __asm__ volatile("mv a1, %0" : : "r" (t));
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_SLEEP));
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    return ret;
}



