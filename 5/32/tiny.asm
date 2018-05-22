
  bits 32

%define SYS_pause 29

  org 0x00200000

ehdr:
  db  0x7F, "ELF"       ; e_ident
  db  0                 ; EI_CLASS
  db  0                 ; EI_DATA
  db  0                 ; EI_VERSION
  db  0                 ; EI_OSABI

_start:
  mov al, SYS_pause
  int 0x80
  ; jmp short _start    ; loop infinitely. if uncommented, change the 3 into
                        ; a 2 in the "times 3..." line

  int3                  ; exit without segfaulting
  times 3 db 0

  dw  2                 ; e_type
  dw  3                 ; e_machine
  dd  0                 ; e_version
  dd  _start            ; e_entry
  dd  phdr - ehdr       ; e_phoff
phdr:
  dd  1                 ; e_shoff       ; p_type
  dd  0                 ; e_flags       ; p_offset
  dd  ehdr              ; e_ehsize      ; p_vaddr
                        ; e_phentsize
  dw  1                 ; e_phnum       ; p_paddr
  dw  0                 ; e_shentsize
  dd  filesize          ; e_shnum       ; p_filesz
                        ; e_shstrndx
  dd  filesize                          ; p_memsz
  dd  5                                 ; p_flags
  dd  0                                 ; p_align

END:

filesize equ END - ehdr

