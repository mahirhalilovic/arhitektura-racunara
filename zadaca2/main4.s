.section .rodata
str: .asciiz "Result: %f"

.section .text
.globl main
main:
  addiu $sp, $sp, -32
  sw $ra, 28($sp)

  # 5.3 0x40a9999a
  # 6.1 0x40c33333
  # 8.8 0x402199999999999A

  lui $t0, 0x40a9
  ori $t0, $t0, 0x999a
  mtc1 $t0, $f12
  
  lui $t0, 0x40c3
  ori $t0, $t0, 0x3333
  mtc1 $t0, $f14

  lui $a3, 0x4021
  ori $a3, $a3, 0x9999
  lui $a2, 0x9999
  ori $a2, $a2, 0x999a

  jal bar

  cvt.d.s $f0, $f0
  la $a0, str
  mfc1 $a2, $f0
  mfhc1 $a3, $f0
  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  jr $ra
