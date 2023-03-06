[org 0x7c00]
KERNAL_OFFSET equ 0x1000

mov [BOOT_DRIVE], dl

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_str

call load_kernel
call switch_to_pm

jmp $

%include "print_str.asm"
%include "disk_load.asm"

%include "gdt.asm"
%include "pm_print_str.asm"
%include "switch_to_pm.asm"

[bits 16]
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_str

    mov bx, KERNAL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call pm_print_str

    call KERNAL_OFFSET

    jmp $

BOOT_DRIVE:
    db 0

MSG_REAL_MODE:
    db "STARTED IN 16-BIT REAL MODE", 0

MSG_PROT_MODE:
    db "NOW IN 32-BIT PROTECTED MODE", 0

MSG_LOAD_KERNEL:
    db "LOADING KERNEL INTO MEMORY", 0

times 510-($-$$) db 0
dw 0xaa55