.section .rodata
str: .asciiz "p = %f\n"

.section .text
.global main
main:

addiu $sp, $sp, -64
sw $ra, 56($sp)

lui $t0, 0x4123
ori $t0, $t0, 0x3333
sw $t0, 60($sp)
addiu $a0, $sp, 60

jal foo

la $a0, str
lwc1 $f4, 60($sp)

cvt.d.s $f4, $f4
mfc1 $a2, $f4
mfhc1 $a3, $f4

jal printf

lw $ra, 56($sp)
addiu $sp, $sp, 64
addiu $v0, $0, 0
jr $ra



