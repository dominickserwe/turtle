rm_print_str:
    pusha
    mov ah, 0x0e            ; text mode

rm_print_str_loop:
    mov al, [bx]            ; hopefully bx contains a pointer to a string
    cmp al, 0               ; check for null terminator
    je rm_print_str_end

    int 0x10

    inc bx                  ; increment string ptr
    jmp rm_print_str_loop

rm_print_str_end:
    mov al, 0xd
    int 0x10

    mov al, 0xa
    int 0x10

    popa
    ret