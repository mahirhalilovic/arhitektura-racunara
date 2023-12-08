.section .text
roundToTick:
  ldc1 $f2, ($a0)
  mtc1 $a1, $f10
  cvt.d.w $f4, $f10

  mul.d $f6, $f2, $f4
  cvt.w.d $f6, $f6

  cvt.d.w $f6, $f6
  div.d $f6, $f6, $f4
  sdc1 $f6, ($a0)
  jr $ra


getTick:
  addiu $t0, $0, 0
  mtc1 $t0, $f2
  mtc1 $t0, $f3

  c.eq.d $f12, $f2
  bc1f if2
  mtc1 $t0, $f0
  mtc1 $t0, $f1
  jr $ra

  if2:
  # 10. 0x4024000000000000
  lui $t1, 0x4024
  addiu $t0, $0, 0
  mtc1 $t0, $f2
  mtc1 $t1, $f3
  c.lt.d $f12, $f2
  bc1f if3

  # 0.001 0x3F50624DD2F1A9FC
  lui $t1, 0x3f50
  ori $t1, $t1, 0x624d
  lui $t0, 0xd2f1
  ori $t0, $t0, 0xa9fc
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  jr $ra

  if3:
  # 100. 0x4059000000000000
  lui $t1, 0x4059
  addiu $t0, $0, 0
  mtc1 $t0, $f2
  mtc1 $t1, $f3
  c.lt.d $f12, $f2
  bc1f if4

  # 0.01 0x3F847AE147AE147B
  lui $t1, 0x3f84
  ori $t1, $t1, 0x7ae1
  lui $t0, 0x47ae
  ori $t0, $t0, 0x147b
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  jr $ra

  if4:
  # 1000. 0x408F400000000000
  lui $t1, 0x408f
  ori $t1, $t1, 0x4000
  addiu $t0, $0, 0
  mtc1 $t0, $f2
  mtc1 $t1, $f3
  c.lt.d $f12, $f2
  bc1f else

  # 0.1 0x3FB999999999999A
  lui $t1, 0x3fb9
  ori $t1, $t1, 0x9999
  lui $t0, 0x9999
  ori $t0, $t0, 0x999a
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  jr $ra

  else:
  # 1. 0x3FF0000000000000
  lui $t1, 0x3ff0
  addiu $t0, $0, 0
  mtc1 $t0, $f0
  mtc1 $t1, $f1
  jr $ra


.globl calculateAmount
calculateAmount:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sdc1 $f12, 24($sp)
  sw $a2, 32($sp)

  ldc1 $f12, 24($sp)
  jal getTick

  lui $t1, 0x3ff0
  addiu $t0, $0, 0
  mtc1 $t0, $f2
  mtc1 $t1, $f3

  div.d $f2, $f2, $f0
  cvt.w.d $f2, $f2
  mfc1 $a1, $f2
  addiu $a0, $sp, 24

  jal roundToTick

  ldc1 $f2, 24($sp)
  lw $t0, 32($sp)
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  mul.d $f0, $f2, $f4

  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra
