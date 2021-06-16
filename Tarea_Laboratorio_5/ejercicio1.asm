org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0

    MOV DH, 10 
    MOV DL, 20 
    MOV byte[200h], 12
    MOV byte[201h], 14
    MOV byte[202h], 16

    call txtmode

    ituno:
        call cursormove 
        MOV CL, [name+SI]
        call charwrite
        XOR CL, CL
        INC DI
        INC DL
        INC SI
        CMP DI, 6
        JB ituno
        call space
        jmp itdos


     itdos:
        MOV DH, [200h]
        call cursormove
        MOV CL, [name+SI]
        call charwrite
        INC DI
        INC DL
        INC SI
        CMP DI,5
        JB itdos
        call space
        jmp ittres


    ittres:
        MOV DH, [201h]
        call cursormove
        MOV CL, [name+SI]
        call charwrite
        INC DI
        INC DL
        INC SI
        CMP DI,7
        JB ittres
        call space
        jmp itcuatro 

     itcuatro:
        MOV DH, [202h]
        call cursormove
        MOV CL, [name+SI]
        call charwrite
        INC DI
        INC DL
        INC SI
        CMP DI,5
        JB itcuatro
        call space
        jmp waitkey

       space:
        MOV DI,0
        MOV DL,20
        RET 



    txtmode: 
        MOV AH, 0h
        MOV AL, 0h
        INT 10h
        RET

     cursormove:
        MOV AH, 02h
        MOV BH, 0h 
        INT 10h
        RET
    charwrite:

        MOV AH, 0Ah
        MOV AL, CL
        MOV BH, 0h
        MOV CX, 1h
        INT 10h
        RET

    waitkey:
        MOV AH, 00h 
        INT 16h

    exit:
        int 20h



    section .data

    name DB 'Oscar Isai Aldana Cruz'