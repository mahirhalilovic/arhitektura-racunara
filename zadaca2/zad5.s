.section .text
.globl foo
foo:
  # f12 f14 a3
  mtc1 $a3, $f4
  cvt.d.s $f14, $f14 # f1
  cvt.d.s $f4, $f4 # f2
  c.lt.d $f4, $f12
  lui $t0, 0x4040
  mtc1 $t0, $f6 # 3.
  bc1f if2

  add.d $f0, $f14, $f4
  sub.d $f0, $f0, $f12
  div.d $f0, $f0, $f6
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

  if2:
  c.eq.d $f12, $f4
  bc1f if3
  c.eq.d $f12, $f14
  bc1t if3
  addiu $t0, $0, 0
  mtc1 $t0, $f8
  cvt.d.s $f8, $f8
  c.eq.d $f12, $f8
  bc1t if3
  mul.d $f0, $f14, $f6
  div.d $f0, $f0, $f12
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

  if3:
  c.lt.d $f12, $f4
  bc1f else
  c.eq.d $f12, $f14
  bc1f else
  addiu $t0, $0, 0
  mtc1 $t0, $f8
  cvt.d.s $f8, $f8
  c.eq.d $f14, $f8
  bc1t else
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sdc1 $f14, 48($sp)
  sub.d $f12, $f12, $f4
  jal abs
  ldc1 $f14, 48($sp)
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  div.d $f0, $f0, $f14
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

  else:
  mul.d $f0, $f14, $f4
  lui $t0, 0x4140
  mtc1 $t0, $f8
  cvt.d.s $f8, $f8
  mul.d $f6, $f12, $f8
  sub.d $f0, $f0, $f6
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra
