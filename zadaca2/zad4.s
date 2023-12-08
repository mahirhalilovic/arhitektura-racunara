.section .text
.globl bar
bar:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  swc1 $f12, 56($sp) # f1
  swc1 $f14, 52($sp) # f2
  mtc1 $a2, $f2
  mthc1 $a3, $f2
  sdc1 $f2, 40($sp) # d1
  c.lt.s $f12, $f14
  bc1f second

  first:
  lwc1 $f2, 56($sp)
  cvt.d.s $f12, $f2
  jal ceil
  add.d $f0, $f0, $f0
  sdc1 $f0, 32($sp) # 2 * ceil(f1)
  lwc1 $f2, 52($sp)
  cvt.d.s $f12, $f2
  jal round
  sdc1 $f0, 24($sp) # round(f2)
  ldc1 $f12, 40($sp)
  jal trunc
  ldc1 $f2, 32($sp)
  add.d $f0, $f0, $f2
  ldc1 $f2, 24($sp)
  sub.d $f0, $f0, $f2
  cvt.s.d $f0, $f0
  j end

  second:
  c.eq.s $f12, $f14
  bc1f third
  lwc1 $f2, 56($sp)
  cvt.d.s $f12, $f2
  jal ceil
  sdc1 $f0, 32($sp) # ceil(f1)
  lwc1 $f2, 52($sp)
  cvt.d.s $f12, $f2
  jal floor
  sdc1 $f0, 24($sp) # floor(f2)
  ldc1 $f12, 40($sp)
  jal trunc
  ldc1 $f2, 32($sp)
  add.d $f0, $f0, $f2
  ldc1 $f2, 24($sp)
  sub.d $f0, $f0, $f2
  cvt.s.d $f0, $f0
  j end

  third:
  ldc1 $f0, 40($sp)
  cvt.s.d $f0, $f0
  j end

  end:
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra
