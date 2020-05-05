; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


; leaw $8, %A
; movw %A, %D


; RAM0 = CONTADOR
leaw $0, %A
movw %A, (%A)

; RAM 1 = RAM 8 (CONTADOR DA RAM)
leaw $8, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)

WHILE:
leaw $1, %A
movw (%A), %D
movw %D, %A
movw (%A), %D

;VALOR DA RAM == 0 END
movw %D, %A
leaw $END, %A
je
nop

; INCREMENTA CONTADOR DA RAM1 +=1
leaw $1, %A
movw (%A), %D
incw %D
movw %D, (%A)

; INCREMENTA O CONTADOR RAM0
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)

; WHILE
movw %D, %A
leaw $WHILE, %A
jne
nop

END:






