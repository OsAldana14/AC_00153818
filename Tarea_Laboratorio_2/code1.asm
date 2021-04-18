        org     200h
        section .text


        mov     byte [200h], "O"
        mov     byte [201h], "I"
        mov     byte [202h], "A"
        mov     byte [203h], "C"
        

        mov     AX, [200h]


        mov     BX, [201h]
        mov     CX, BX

        mov     BP, 200h
        mov     SI, 002h
        mov     DX, [BP+SI]

        mov     DI, [BP+003h]

        int     20h