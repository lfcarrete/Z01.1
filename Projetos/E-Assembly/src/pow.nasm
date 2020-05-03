; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

; D = RAM[1]
leaw $1, %A
movw (%A), %D

; RAM[2] = RAM[1]
leaw $2, %A
movw, %D, (%A)

LOOP:
; RAM[0] += RAM[1]
leaw $0, %A
movw (%A), %D
leaw $1, %A
movw (%A), %A
addw %D, %A, %D
leaw $0, %A
movw %D, (%A)

;COUNTER -= 1
leaw $2, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $2, %A
movw %D, (%A)

; IF COUNTER != 0 => LOOP
movw %D, %A
leaw $LOOP, %A
jne
nop
