//
// Created by os on 8/13/22.
//

#ifndef PROJECT_BASE_SYSCALL_CODES_H
#define PROJECT_BASE_SYSCALL_CODES_H

enum call_codes {
    MEM_ALLOC = 0x01,
    MEM_FREE = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPACH = 0x13,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    THREAD_SLEEP = 0x31,
    GETC = 0x41,
    PUTC = 0x42,
    THREAD_INIT = 0x43,
    THREAD_START = 0x44
};

#endif //PROJECT_BASE_SYSCALL_CODES_H
