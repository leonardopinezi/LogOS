shell:
    ; HELP
    mov si, buffer_input
    mov di, cmd_help
    call strcmp

    cmp al, 1
    je .c_help

    ; CLEAR
    mov si, buffer_input
    mov di, cmd_cls
    call strcmp

    cmp al, 1
    je .c_cls

    call newline
    
    mov si, unknow_cmd
    call puts
    mov si, buffer_input
    call puts
    call newline

    ret
.c_help:
    mov si, help_string
    call puts
    call newline
    ret
.c_cls:
    call clear
    ret


; Commands
cmd_help db "help", 0
cmd_cls db "clear", 0

; Strigs
unknow_cmd db "Unknow command: ", 0
help_string db 0x0D, 0x0A, "help", 0x0D, 0x0A, "clear", 0x0D, 0x0A, "echo", 0