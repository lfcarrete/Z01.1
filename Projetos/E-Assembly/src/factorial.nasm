; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $1, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $0, %A 
movw (%A), %D

leaw $END, %A ; !=0
je %D
nop

FACTORIAL:

leaw %1, %A ; RAM[3] == RAM[1]
movw (%A), %D
leaw $3, %A
movw %D, (%A)

leaw $0, %A
movw (%A), %D

leaw $END,%A 
decw %D
je %D
nop

leaw $2, %A ; RAM[2] == RAM[0] 
movw %D, (%A)


leaw $0, %A  ; RAM[0] - 1
movw (%A), %D
decw %D
movw %D, (%A)


MULT:

leaw $1, %A 
movw (%A), %D

leaw $3, %A 
movw (%A), %A

addw %D, %A, %D

leaw $1, %A
movw %D, (%A)

leaw $2, %A ; counter -= 1
movw (%A), %A
decw %A
movw %A, %D
leaw $2, %A
movw %D, (%A)


leaw $MULT, %A ; IF counter == 0 
jne %D
nop



leaw $FACTORIAL, %A
jmp 
nop

END: