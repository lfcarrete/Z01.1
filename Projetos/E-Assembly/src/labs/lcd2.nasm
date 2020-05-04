<<<<<<< HEAD

leaw $65535, %A
movw %A, %D
leaw $16384, %A
movw %D, (%A)

leaw $65535, %A
movw %A, %D
leaw $18593, %A
movw %D, (%A)

leaw $65535, %A
movw %A, %D
leaw $21183, %A
movw %D, (%A)
=======
; Arquivo: sw1.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 4/2020

leaw $16384,%A
movw $-1, (%A)
leaw $18794, %A
movw $-1, (%A)
leaw $21183, %A
movw $-1, (%A)
>>>>>>> upstream/master
