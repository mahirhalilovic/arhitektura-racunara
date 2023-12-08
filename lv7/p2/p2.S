.section .text
partition_impl:
    bne $a0, $a1, cont
    jr $ra

cont:
    addiu $sp, $sp, -64
    sw $a0, 60($sp)
    sw $a1, 56($sp)
    sw $ra, 52($sp)
    sw $a2, 48($sp)

    lw $a0, ($a0)
    jalr $a2

    lw $a0, 60($sp)
    lw $a1, 56($sp)
    lw $ra, 52($sp)
    lw $a2, 48($sp)

    beq $v0, $0, else2
    lw $t0, ($a0) # $t0 -> first
    lw $t1, ($a1) # $t1 -> last
    sw $t0, ($a1)
    sw $t1, ($a0)
    addiu $a1, $a1, -4
    j rekurzija

else2:
    addiu $a0, $a0, 4

rekurzija:
    jal partition_impl
    lw $ra, 52($sp)
    addiu $sp, $sp, 64
    jr $ra


.global partition

partition:
    slti $t0, $a1, 2
    beq $t0, $0, else
    jr $ra

else:
    sll $a1, $a1, 2
    addiu $a1, $a1, -4
    addu $a1, $a0, $a1

    addiu $sp, $sp, -64
    sw $ra, 60($sp)

    jal partition_impl

    lw $ra, 60($sp)
    addiu $sp, $sp, 64 
    jr $ra
