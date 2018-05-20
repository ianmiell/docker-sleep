nasm -f elf64 sleep.asm -o sleep.o
ld sleep.o -o sleep
strip -s sleep
./sleep

