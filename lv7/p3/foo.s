.section .data
a: .word 5
.global c
c: .float 2.5

.section .text
.global foo
foo:
la $t0, a
lwc1 $f4, ($t0)
cvt.s.w $f4, $f4

la $t0, c
lwc1 $f6, ($t0)

add.s $f4, $f4, $f6 # $f4 -> a+ c 

lwc1 $f6, ($a0) 
add.s $f4, $f4, $f6

swc1 $f4, ($a0)

jr $ra

