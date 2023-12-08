.section .rodata
str: .asciiz "MyMax: %f\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -80
  sw $ra, 76($sp)
  # 1. --- 0x3FF0000000000000
  # 5.7 -- 0x4016CCCCCCCCCCCD
  # 9.4 -- 0x4022CCCCCCCCCCCD
  # 14.8 - 0x402D99999999999A
  # 7.1 -- 0x401C666666666666
  # 8.2 -- 0x4020666666666666
  # 10.5 - 0x4025000000000000

  lui $t1, 0x3ff0
  addiu $t0, $0, 0
  sw $t0, 16($sp)
  sw $t1, 20($sp)

  lui $t1, 0x4016
  ori $t1, $t1, 0xcccc
  lui $t0, 0xcccc
  ori $t0, $t0, 0xcccd
  sw $t0, 24($sp)
  sw $t1, 28($sp)

  lui $t1, 0x4022
  ori $t1, $t1, 0xcccc
  lui $t0, 0xcccc
  ori $t0, $t0, 0xcccd
  sw $t0, 32($sp)
  sw $t1, 36($sp)

  lui $t1, 0x402d
  ori $t1, $t1, 0x9999
  lui $t0, 0x9999
  ori $t0, $t0, 0x999a
  sw $t0, 40($sp)
  sw $t1, 44($sp)

  lui $t1, 0x401c
  ori $t1, $t1, 0x6666
  lui $t0, 0x6666
  ori $t1, $t1, 0x6666
  sw $t0, 48($sp)
  sw $t1, 52($sp)

  lui $t1, 0x4020
  ori $t1, $t1, 0x6666
  lui $t0, 0x6666
  ori $t1, $t1, 0x6666
  sw $t0, 56($sp)
  sw $t1, 60($sp)

  lui $t1, 0x4025
  addiu $t0, $0, 0
  sw $t0, 64($sp)
  sw $t1, 68($sp)

  ldc1 $f12, 16($sp)
  addiu $a2, $sp, 16
  addiu $a3, $0, 7
  jal mymax

  la $a0, str
  mfc1 $a2, $f0
  mfc1 $a3, $f1
  jal printf

  lw $ra, 76($sp)
  addiu $sp, $sp, 80
  jr $ra
