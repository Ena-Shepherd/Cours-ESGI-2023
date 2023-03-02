extern  GetStdHandle, WriteFile, ExitProcess
global Main

section .bss
bytesWritten resd 1

section .data
message: db 'Hello, World', 10,0
messageLen: equ $-message

section .text
Main:
    ; hStdOut = GetstdHandle(STD_OUTPUT_HANDLE)

    push	dword -11
    call    GetStdHandle

    ; WriteFile(hstdOut, message, length(message),
    ;           &bytesWritten, null);
    push    dword 0
	push    bytesWritten
    push    messageLen
    push    message
    push    eax
    call    WriteFile

    ; ExitProcess(0)
    push    0
    call    ExitProcess
