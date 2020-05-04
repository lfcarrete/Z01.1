; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

 LOOP:

; TotalOld = RAM[3]

leaw $3, %A
movw (%A), %D

; A = RAM[0]

leaw $0, %A
movw (%A), %A

; TotalNew = TotalOld + A

addw %D, %A, %D

; RAM[3] = TotalNew

leaw $3, %A
movw %D, (%A)

; Counter -= 1

leaw $1, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

; IF Counter = 0
movw %D, %A
leaw $LOOP, %A
jne
nop
