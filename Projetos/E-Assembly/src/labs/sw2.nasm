<<<<<<< HEAD
leaw $21185, %A
movw %A, %D
not %D
leaw $21184, %A
movw %D, (%A)
=======
; Arquivo: sw1.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 4/2020
;
; Faça os LEDs serem o inverso das chaves
; LED = !SW

leaw $21185, %A
movw (%A), %D
notw %D
leaw $21184, %A
movw %D, (%A)

>>>>>>> upstream/master
