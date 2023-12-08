.section .text
.globl main
main:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  addiu $t0, $0, 97
  sb $t0, 40($sp)
  addiu $t0, $0, 98
  sb $t0, 41($sp)
  addiu $t0, $0, 99
  sb $t0, 42($sp)
  addiu $a0, $sp, 40
  addiu $a1, $0, 3
  addiu $a2, $0, 3
  jal combinations

  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  addiu $v0, $0, 0
  jr $ra
