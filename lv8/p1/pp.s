.section .text
.globl foo
foo:
  mtc1 $a1, $f4
  cvt.s.w $f4, $f4
  c.lt.s $f12, $f4

  bc1f else
  cvt.d.s $f6, $f12
  cvt.d.s $f4, $f4
  add.d $f0, $f4, $f12
  jr $ra

  else:
  cvt.d.s $f6, $f12
  cvt.d.s $f4, $f4
  sub.d $f0, $f6, $f4
  jr $ra
