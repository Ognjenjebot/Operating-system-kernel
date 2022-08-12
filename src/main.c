#include "../lib/console.h"

void main(){
    __putc('o');
    __putc('s');
    __putc('1');
    __putc('\n');
    __putc('\n');

    while(1){
        char character = __getc();
        __putc(character + 30);
    }
}