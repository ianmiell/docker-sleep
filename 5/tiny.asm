
  bits 64

%define SYS_pause 34

  org 0x100000000

ehdr:                   ; Elf64_Ehdr
  db  0x7f, "ELF"       ; e_ident   EI_MAG
  db  2                 ;           EI_CLASS
  db  1                 ;           EI_DATA
  db  1                 ;           EI_VERSION
  db  0                 ;           EI_OSABI
_start:
  add rax, SYS_pause    ; padding
  syscall
  ; jmp short _start    ; loop infinitely. if uncommented, remove the
                        ; 'db 0' under the int3
  int3                  ; exit without segfaulting
  db  0

  dw  2                 ; e_type
  dw  0x3e              ; e_machine
  dd  1                 ; e_version
  dd  _start - ehdr     ; e_entry (lo)
phdr:
  dd  1                 ; e_entry (hi)  ; p_type
  dd  phdr - ehdr       ; e_phoff (lo)  ; p_flags
  dd  0                 ; e_phoff (hi)  ; p_offset (lo)
  dd  0                 ; e_shoff (lo)  ; p_offset (hi)
  dq  ehdr              ; e_shoff (hi)  ; p_vaddr
                        ; e_flags
  dw  0x40              ; e_ehsize      ; p_paddr (0)
  dw  phdr.end - phdr   ; e_phentsize   ;         (1)
  dw  1                 ; e_phnum       ;         (2)
  dw  0                 ; e_shentsize   ;         (3)
  dq  filesize          ; e_shnum       ; p_filesz
                        ; e_shstrndx
  dq  filesize                          ; p_memsz
  dq  0                                 ; p_align
.end:

END:

filesize  equ END - ehdr

