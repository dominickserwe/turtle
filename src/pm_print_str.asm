[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

pm_print_str:
    pusha
    mov edx, VIDEO_MEMORY

pm_print_str_loop:
    mov al, [ebx]           ; hopefully bx contains a pointer to a string
    mov ah, WHITE_ON_BLACK

    cmp al, 0               ; check for null terminator
    je pm_print_str_end

    mov [edx], ax

    add ebx, 1
    add edx, 2
    
    jmp pm_print_str_loop

pm_print_str_end:
    popa
    ret