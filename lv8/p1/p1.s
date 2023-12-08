.section .text
.global foo
foo:
    mtc1 $a1, $f5
    cvt.s.w $f4, $f5

    c.lt.s $f12, $f4
    bc1f else

    cvt.d.s $f12, $f12
    mtc1 $a1, $f6
    cvt.d.w $f6, $f6
    add.d $f0, $f6, $f12
    jr $ra

else:
    mtc1 $a1, $f6
    cvt.d.w $f6, $f6
    cvt.d.s $f12, $f12
    sub.d $f0, $f12, $f6
    jr $ra