//
// Created by os on 9/10/22.
//
#include "../h/_buffer.hpp"


//static KeyboardBuffer* instance () {
//    static KeyboardBuffer _instance;
//    return &_instance;
//}

//imlementacija uzeta iz zadatka sa klk3
char KeyboardBuffer::take () {
    itemAvailable->wait();
//    kbint_mask();
    char c = buffer[head];
    head = (head+1)%KB_SIZE;
    count--;
//    kbint_unmask();
    return c;
}
void KeyboardBuffer::append (char c) {
    if (count<KB_SIZE) {
        buffer[tail] = c;
        tail = (tail+1)%KB_SIZE;
        count++;
        itemAvailable->signal();
    }
}