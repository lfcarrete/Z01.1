; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

; LEFT/RIGHT = bin:1100000000000011 = dec:49155
; TOP/BOTTOM = bin:1111111111111111 = dec:65535

; 1
leaw $65535, %A
movw %A, %D
leaw $16784, %A
movw %D, (%A)

; 2
leaw $65535, %A
movw %A, %D
leaw $16804, %A
movw %D, (%A)

; 3
leaw $49155, %A
movw %A, %D
leaw $16824, %A
movw %D, (%A)

; 4
leaw $49155, %A
movw %A, %D
leaw $16844, %A
movw %D, (%A)

; 5
leaw $49155, %A
movw %A, %D
leaw $16864, %A
movw %D, (%A)

; 6
leaw $49155, %A
movw %A, %D
leaw $16884, %A
movw %D, (%A)

; 7
leaw $49155, %A
movw %A, %D
leaw $16884, %A
movw %D, (%A)

; 8
leaw $49155, %A
movw %A, %D
leaw $16904, %A
movw %D, (%A)

; 9
leaw $49155, %A
movw %A, %D
leaw $16924, %A
movw %D, (%A)

; 10
leaw $49155, %A
movw %A, %D
leaw $16944, %A
movw %D, (%A)

; 11
leaw $49155, %A
movw %A, %D
leaw $16964, %A
movw %D, (%A)

; 12
leaw $49155, %A
movw %A, %D
leaw $16984, %A
movw %D, (%A)

; 13
leaw $49155, %A
movw %A, %D
leaw $17004, %A
movw %D, (%A)

; 14
leaw $49155, %A
movw %A, %D
leaw $17024, %A
movw %D, (%A)

; 15
leaw $65535, %A
movw %A, %D
leaw $17044, %A
movw %D, (%A)

; 16
leaw $65535, %A
movw %A, %D
leaw $17064, %A
movw %D, (%A)
