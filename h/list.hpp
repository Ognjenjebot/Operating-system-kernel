//
// Created by marko on 20.4.22..
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP
#include  "scheduler.hpp"
#include "tcb.hpp"

template<typename T>
class List
{
private:
    struct Elem
    {
        T *data;
        Elem *next;
        int sleepTime;
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
        Elem(T *data) : data(data), next(nullptr), sleepTime(0) {}
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}

    List(const List<T> &) = delete;

    List<T> &operator=(const List<T> &) = delete;

    void addFirst(T *data)
    {
        Elem *elem = new Elem(data, head);
        head = elem;
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
        if (tail)
        {
            tail->next = elem;
            tail = elem;
        } else
        {
            head = tail = elem;
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }

        Elem *elem = head;
        head = head->next;
        if (!head) { tail = 0; }

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T *peekFirst()
    {
        if (!head) { return 0; }
        return head->data;
    }

    T *removeLast()
    {
        if (!head) { return 0; }

        Elem *prev = 0;
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
        {
            prev = curr;
        }

        Elem *elem = tail;
        if (prev) { prev->next = 0; }
        else { head = 0; }
        tail = prev;

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T *peekLast()
    {
        if (!tail) { return 0; }
        return tail->data;
    }

    void addSleepingThread(T *data, int time){
        Elem *elem = new Elem(data);
        if(!head){
            head = elem;
            elem->next = nullptr;
            elem->sleepTime = time;
            tail = head;
            return;
        }
        int timeCount = 0;
        Elem *next = head, *prev = nullptr;

        while(time >= timeCount + next->sleepTime){
             timeCount += next->sleepTime;
             prev= next;
             next = next->next;
             if(next == nullptr)
                 break;
        }
        if(!prev){
            head = elem;
            head->next = next;
            head->next->sleepTime -=  head->sleepTime;
        }
        else {
            prev->next = elem;
            elem->next = next;
            int diff = time - timeCount;
            elem->sleepTime = diff;
            if(next != nullptr)
                next->sleepTime -= diff;
        }
    }

    void removeSleepingThreads(){
        _thread *t;
        while(head->sleepTime == 0){
            t = head->data;
            head = head->next;
            t->setSleep();
            Scheduler::put(t);
        }
    }

    void sleepControl(){
        if(head != nullptr && --head->sleepTime == 0) //dekrementira vreme i radi proveru
            removeSleepingThreads();
    }
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP
