//
// Created by os on 9/15/22.
//
//
#include "../h/syscall_cpp.hpp"

PeriodicThread::PeriodicThread(time_t period) : Thread(){

    this->period = period;
}

//void PeriodicThread::run() override{
//    while(true){
//    periodicActivation();
//    time_sleep(this->period);
//}
//}