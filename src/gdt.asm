gdt_start:

gdt_null:
    dd 0x0
    dd 0x0

gdt_code:
    dw 0xffff       ; limit
    dw 0x0          ; base
    db 0x0          ; base
    db 10011010b    ; type flags
    db 11001111b    ; limit
    db 0x0          ; base

gdt_data:
    dw 0xffff       ; limit
    dw 0x0          ; base
    db 0x0          ; base
    db 10010010b    ; type flags
    db 11001111b    ; limit
    db 0x0          ; base

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start