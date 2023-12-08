.section .data
a: .word 5

.section .text
.global foo

foo:
    la $t0, a
    lwc1 $f4, ($t0)
    cvt.d.w $f4, $f4

    mtc1 $a2, $f6
    mtc1 $a3, $f7

    add.d $f4, $f4, $f6

    lwc1 $f6, ($a0)
    lwc1 $f7, 4($a0)

    add.d $f6, $f6, $f4
    swc1 $f6, ($a0)
    swc1 $f7, 4($a0)

    jr $ra
