.section .data
d: .double 7.4

.section .text
.globl bar
bar:
  # d - f2, *x - f4, y - f6, z - f8, 1.0 - f10
  la $t0, d
  ldc1 $f2, ($t0)
  ldc1 $f4, ($a0)
  mtc1 $a1, $f6
  cvt.d.s $f6, $f6
  mtc1 $a2, $f8
  cvt.d.s $f8, $f8
  lui $t1, 0x3ff0
  addiu $t0, $0, 0
  mtc1 $t0, $f10
  mtc1 $t1, $f11

  c.lt.d $f6, $f4
  bc1f else
  c.lt.d $f8, $f4
  bc1f else

  add.d $f2, $f2, $f10
  j cnt

  else:
  sub.d $f2, $f2, $f10

  cnt:
  add.d $f4, $f4, $f6
  add.d $f4, $f4, $f8
  addiu $t0, $0, 3
  mtc1 $t0, $f6
  cvt.d.w $f6, $f6
  div.d $f0, $f4, $f6
  add.d $f0, $f0, $f2
  la $t0, d
  sdc1 $f2, ($t0)
  cvt.s.d $f0, $f0
  jr $ra
