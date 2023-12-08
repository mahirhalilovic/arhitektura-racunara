.section .rodata
str: .asciiz "foo(%d, %d), %hd\n"

.section .text
.globl main
main:
  addiu $t0, $0, 2
  
  for1:
  slti $t2, $t0, 6
  beq $t2, $0, for1exit
  addiu $t1, $0, 3
  
  for2:
  slti $t2, $t1, 7
  beq $t2, $0, for2exit
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $t0, 56($sp)
  sw $t1, 52($sp)
  addu $a0, $0, $t0
  addu $a1, $0, $t1
  jal foo
  la $a0, str
  lw $a1, 56($sp)
  lw $a2, 52($sp)
  addu $a3, $0, $v0
  jal printf
  lw $ra, 60($sp)
  lw $t0, 56($sp)
  lw $t1, 52($sp)
  
  addiu $t1, $t1, 1
  j for2

  for2exit:
  addiu $t0, $t0, 1
  j for1

  for1exit:
  addiu $v0, $0, 0
  jr $ra
