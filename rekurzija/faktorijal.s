.section .text
.global faktorijal
faktorijal:
  addiu $sp, $sp, -24
  sw $ra, 20($sp)
  beq $a0, $0, return
  j recursion
  return:
  addiu $v0, $0, 1
  jr $ra
  recursion:
  sw $a0, 16($sp)
  addiu $a0, $a0, -1
  jal faktorijal
  lw $t0, 16($sp)
  mult $t0, $v0
  mflo $v0
  lw $ra, 20($sp)
  addiu $sp, $sp, 24
  jr $ra
