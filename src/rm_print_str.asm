rm_print_str:
    pusha

    rm_print_str_loop:
        mov al, [bx]        ; hopefully bx contains a pointer to a string
        cmp al, 0           ; check for null terminator
        je rm_print_str_end

        int 0x10

        inc bx              ; increment string ptr
        jmp rm_print_str_loop
    rm_print_str_end:

    popa
    ret