.section .rodata
str: .asciiz "Result: %d"

.section .text
.globl main
main:
  # 4.3 0x4011333333333333
  # 4.3f 0x4089999a
  # 9.7f 0x411b3333

  addiu $sp, $sp, -32
  sw $ra, 28($sp)

  lui $t1, 0x4011
  ori $t1, $t1, 0x3333
  lui $t0, 0x3333
  ori $t0, $t0, 0x3333
  mtc1 $t0, $f12
  mtc1 $t1, $f13

  lui $t0, 0x4089
  ori $t0, $t0, 0x999a
  mtc1 $t0, $f14

  lui $a3, 0x411b
  ori $a3, $a3, 0x3333

  jal foo

  la $a0, str
  add $a1, $0, $v0
  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  jr $ra
