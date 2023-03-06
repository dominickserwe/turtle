print_str:
    pusha
    mov ah, 0x0e            ; text mode

print_str_loop:
    mov al, [bx]            ; hopefully bx contains a pointer to a string
    cmp al, 0               ; check for null terminator
    je print_str_end

    int 0x10

    inc bx                  ; increment string ptr
    jmp print_str_loop

print_str_end:
    mov al, 0xd
    int 0x10                ; print carriage return

    mov al, 0xa             ; print new line
    int 0x10

    popa
    ret