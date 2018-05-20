global  _start
section .text
_start:
  mov eax, 29
  int 0x80
  ; exit
  mov eax, 1
  mov ebx, 0
  int 0x80
