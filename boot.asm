[org 0x7c00]

; text mode
mov ah, 0x0e

mov bx, my_string
call println

mov bx, my_other_string
call println

call print_alpha

jmp $

println:
    pusha

    println_loop:
        mov al, [bx]        ; hopefully bx contains a pointer to a string
        cmp al, 0           ; check for null terminator
        je println_end

        int 0x10

        inc bx              ; increment string ptr
        jmp println_loop
    println_end:

    mov al, 0xd
    int 0x10                ; print carriage return

    mov al, 0xa
    int 0x10                ; print new line

    popa
    ret

my_string:
    db "HELLO TURTLE", 0

my_other_string:
    db "NEW LINE NEW LINE NEW LINE", 0

times 510-($-$$) db 0
dw 0xaa55