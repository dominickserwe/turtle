rm_disk_load:
    push dx

    mov ah, 0x2     ; disk read mode
    
    mov al, dh      ; read from dh
    mov ch, 0x0     ; cylinder 0
    mov dh, 0x0     ; head 0
    mov cl, 0x2     ; sector 2

    int 0x13

    jc disk_read_fail   ; failed  to read

    pop dx
    cmp dh, al
    jne disk_read_bad  ; bad read

    ret

disk_read_fail:
    mov bx, DISK_ERROR_MSG
    call rm_print_str
    jmp $

disk_read_bad:
    mov bx, BAD_READ_MSG
    call rm_print_str
    jmp $

DISK_ERROR_MSG:
    db "DISK READ ERROR", 0

BAD_READ_MSG:
    db "DISK READ ERROR (BAD READ)", 0