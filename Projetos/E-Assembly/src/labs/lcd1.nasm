<<<<<<< HEAD
leaw $65535, %A
movw %A, %D
leaw $16384, %A
movw %D, (%A)
























































































































































































































=======
; Arquivo: sw1.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 4/2020

leaw $16384, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

LOOP:
  leaw $0, %A
  movw (%A), %D
  addw $1, %D, (%A)
  movw %D, %A
  movw $-1, (%A)
  leaw $LOOP, %A
  jmp
  nop
>>>>>>> upstream/master
