.section .rodata
str: .asciiz "Result: %f"

.section .text
.globl main
main:
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  
  # 2.1f 0x40066666
  # 7.1 0x401C666666666666
  # 1.7f 0x3fd9999a

  lui $t1, 0x401c
  ori $t1, $t1, 0x6666
  lui $t0, 0x6666
  ori $t0, $t0, 0x6666

  sw $t0, 16($sp)
  sw $t1, 20($sp)

  lui $t0, 0x4006
  ori $t0, $t0, 0x6666
  mtc1 $t0, $f12

  addiu $a1, $sp, 16

  lui $a2, 0x3fd9
  ori $a2, $a2, 0x999a
  addiu $a3, $0, 4

  jal baz

  la $a0, str
  mfc1 $a2, $f0
  mfc1 $a3, $f1

  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  addiu $v0, $0, 0
  jr $ra
