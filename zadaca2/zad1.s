.section .text
.globl foo
foo:
  slti $t0, $a0, 2
  beq $t0, $0, if2
  addiu $v0, $0, 0
  jr $ra
  
  if2:
  slti $t0, $a1, 3
  beq $t0, $0, if3
  addiu $v0, $0, 1
  jr $ra
  
  if3:
  slt $t0, $a0, $a1
  beq $t0, $0, else
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a0, 56($sp)
  sw $a1, 52($sp)
  addiu $a0, $a0, -1
  addiu $a1, $a1, -3
  jal foo
  lw $ra, 60($sp)
  lw $t0, 56($sp)
  addu $v0, $v0, $t0
  addiu $sp, $sp, 64
  jr $ra

  else:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a0, 56($sp)
  sw $a1, 52($sp)
  addiu $a0, $a0, -2
  addiu $a1, $a1, -1
  jal foo
  lw $ra, 60($sp)
  lw $t0, 56($sp)
  addu $v0, $v0, $t0
  lw $t0, 52($sp)
  subu $v0, $v0, $t0
  addiu $sp, $sp, 64
  jr $ra
