.section .rodata
str: .asciiz "Amount(%f, 307) = %f\n"

.section .text
.globl main
main:
  # 3.451748 0x400B9D2E0E30446B

  lui $t1, 0x400b
  ori $t1, $t1, 0x9d2e
  lui $t0, 0x0e30
  ori $t0, $t0, 0x446b

  mtc1 $t0, $f2
  mtc1 $t1, $f3

  # 4000. 0x40AF400000000000

  lui $t1, 0x40af
  ori $t1, $t1, 0x4000
  addiu $t0, $0, 0
  mtc1 $t0, $f4
  mtc1 $t1, $f5

  for:
  c.lt.d $f2, $f4
  bc1f exit

  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sdc1 $f2, 32($sp)
  sdc1 $f4, 40($sp)

  ldc1 $f12, 32($sp)
  addiu $a2, $0, 307

  jal calculateAmount

  la $a0, str
  ldc1 $f2, 32($sp)
  mfc1 $a2, $f2
  mfc1 $a3, $f3
  sdc1 $f0, 16($sp)

  jal printf

  lw $ra, 60($sp)
  ldc1 $f2, 32($sp)
  ldc1 $f4, 40($sp)

  # 10. 0x4024000000000000
  
  lui $t1, 0x4024
  addiu $t0, $0, 0
  mtc1 $t0, $f10
  mtc1 $t1, $f11

  mul.d $f2, $f2, $f10

  j for

  exit:
  addiu $v0, $0, 0
  addiu $sp, $sp, 64
  jr $ra
