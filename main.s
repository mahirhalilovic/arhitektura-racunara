.section .data
.globl x
x: .double 10.51

.section .rodata
str: .asciiz "The result is %.2f\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  lui $t0, 0x40bc
  ori $t0, $t0, 0xcccd
  sw $t0, 20($sp)
  lui $t0, 0x406c
  ori $t0, $t0, 0xcccd
  sw $t0, 24($sp)
  la $t0, x
  ldc1 $f12, ($t0)
  addiu $a2, $sp, 20
  addiu $a3, $sp, 24
  jal foo

  cvt.d.s $f0, $f0
  la $a0, str
  mfc1 $a2, $f0
  mfc1 $a3, $f1
  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  addiu $v0, $0, 0
  jr $ra
