.section .rodata
str: .asciiz "Reverse square root of %d is %f"

.section .text
.globl main
main:
  lui $t0, 0x4180
  mtc1 $t0, $f12
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  jal Q_rsqrt
  la $a0, str
  addiu $a1, $0, 16
  cvt.d.s $f0, $f0
  mfc1 $a2, $f0
  mfhc1 $a3, $f0
  jal printf
  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  jr $ra
