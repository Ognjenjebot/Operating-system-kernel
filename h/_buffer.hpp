//
// Created by os on 9/10/22.
//

#ifndef PROJECT_BASE__BUFFER_HPP
#define PROJECT_BASE__BUFFER_HPP

#include "_sem.hpp"

class KeyboardBuffer {
public:
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    char take ();
    void append (char c);
    _sem *itemAvailable;
    uint64 getCount() { return count; }
private:
    static const size_t KB_SIZE = 256;
    char buffer[KB_SIZE];
    size_t head, tail, count;
};

#endif //PROJECT_BASE__BUFFER_HPP
