//
// Created by os on 9/14/22.
//
#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) {

//    thread_create(&myHandle, body, arg);
// ipak ne sme da se startuje nit, a thread_create je startuje
//zato sam dodao sis poziv koji radi sve isto, ali ne ubacuje nit u scheduler
    thread_initialization(&myHandle, body, arg);
}

Thread::Thread() {
    thread_initialization(&myHandle, wrapper, this);
}

Thread::~Thread(){
    thread_exit();
}

int Thread::start(){
    thread_start(myHandle);
    return 0;
}

void Thread::dispatch(){
    thread_dispatch();
}

int Thread::sleep(time_t t){
    return time_sleep(t);
}

//kao na vezbama, agumenti se poklapaju za vec postojeci body, a mora da se posalje this u konstruktoru
//jer je wrapper staticka metoda
void Thread::wrapper(void *thread)
{
    ((Thread*)thread)->run();
}





