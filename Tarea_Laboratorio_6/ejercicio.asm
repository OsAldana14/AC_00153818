; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

	; print msg1
	mov 	DX, msg1
	call  	EscribirCadena

	; input frase
	mov 	BP, frase
	call  	LeerCadena

        ; comparar
        mov     AL, contra
        loop    CompCadenas

	call	EsperarTecla

	int 	20h

	section	.data

msg1	db	"Ingresa la contraseña de 5 digitos: ", "$"
msg2 	db 	"Incorrecto", "$"
msg3 	db 	"Bienvenido", "$"
contra  db      "vamos", "$"
num     db      4
frase 	times 	20  	db	" " 	

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret


; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret

CompCadenas:
         xor     SI, SI          ; SI = 0
while1:  
        MOV     CL, [frase+SI];
        cmp     CL, [contra+SI]        ; comparar contrasenia con lo ingresado
        cmp     SI, num
        jne     comp
        inc     SI              ; SI++
        jz      while1
CC:
        mov 	DX, msg3
	call  	EscribirCadena

CI:
        mov     DX, msg2
        call    EscribirCadena

comp:
        cmp     frase[si], "$"
