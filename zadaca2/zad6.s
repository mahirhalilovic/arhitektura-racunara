.section .text
.globl baz
baz:
  # $f12 - f1, $a1 - p1, $a2 - f2, $a3 - n
  ldc1 $f2, ($a1)
  mtc1 $a2, $f4
  mtc1 $a3, $f8
  cvt.s.w $f6, $f8

  # f1 - $f12, *p1 - $f2, f2 - $f4, n - $f6

  addiu $t0, $0, 0
  mtc1 $t0, $f8
  mthc1 $t0, $f8 # 0. - f8
  c.eq.d $f2, $f8
  bc1t cont
  add.s $f10, $f12, $f4
  c.lt.s $f10, $f6
  bc1t cont

  if2:
  c.eq.d $f2, $f8
  bc1t else
  mul.s $f10, $f4, $f6
  sub.s $f10, $f12, $f10
  cvt.d.s $f10, $f10
  div.d $f0, $f10, $f2
  jr $ra

  else:
  cvt.d.s $f12, $f12
  cvt.d.s $f4, $f4
  cvt.d.s $f6, $f6
  mul.d $f0, $f12, $f2
  add.d $f0, $f0, $f4
  add.d $f0, $f0, $f6
  jr $ra

  cont:
  mul.s $f0, $f4, $f6
  add.s $f0, $f0, $f12
  cvt.d.s $f0, $f0
  jr $ra
