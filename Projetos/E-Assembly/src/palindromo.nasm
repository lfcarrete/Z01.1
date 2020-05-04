; Arquivo: palindromo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se uma palavra salva na memória
; é um palíndromo ou não. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.
; 
; A palavra possui tamanho fixo de 5 caracteres,
; começando no endereço 10 da RAM e terminando no
; endereço 14 da RAM. A palavra é codificado em
; ASCII.

; exemplo:
;  RAM[10] = a
;  RAM[11] = r
;  RAM[12] = a
;  RAM[13] = r
;  RAM[14] = a


; RAM[0] = 0
leaw $0, %A
movw %A, (%A)

; D = RAM[10]
leaw $10, %A
movw (%A), %D

; A = RAM[14]
leaw $14, %A
movw (%A), %A

; IF RAM[10] != RAM[14] => END
subw %A, %D, %D
movw %D, %A
leaw $END, %A
jne
nop

; D = RAM[11]
leaw $11, %A
movw (%A), %D

; A = RAM[13]
leaw $13, %A
movw (%A), %A

; IF RAM[11] != RAM[13] => END
subw %A, %D, %D
movw %D, %A
leaw $END, %A
jne
nop

; IF RAM[10] == RAM[14] & RAM[11] == RAM[13] => RAM[0] = 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

END: