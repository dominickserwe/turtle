[org 0x7c00]

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call rm_print_str

call switch_to_pm

jmp $

%include "rm_print_str.asm"
%include "gdt.asm"
%include "print_str.asm"
%include "switch_to_pm.asm"

[bits 32]

BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call pm_print_str

    jmp $

MSG_REAL_MODE:
    db "STARTED IN 16-BIT REAL MODE", 0

MSG_PROT_MODE:
    db "NOW IN 32-BIT PROTECTED MODE", 0

times 510-($-$$) db 0
dw 0xaa55
