.section .rodata
strc: .asciiz "%c"
strn: .asciiz "\n"

.section .data
d: .word

.section .text
print_comb:
  addiu $t0, $0, 0
  
  for_pc:
  slt $t1, $t0, $a0
  beq $t1, $0, exit_for_pc
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  sw $t0, 24($sp)
  sw $a0, 20($sp)
  la $t1, d
  addu $t1, $t1, $t0
  lbu $a1, ($t1)
  la $a0, strc
  jal printf
  lw $ra, 28($sp)
  lw $t0, 24($sp)
  lw $a0, 20($sp)
  addiu $t0, $t0, 1
  j for_pc

  exit_for_pc:
  la $a0, strn
  sw $ra, 28($sp)
  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32 
  jr $ra

.globl combinations_impl
combinations_impl:
  bne $a3, $0, cont
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  addu $a0, $0, $a1
  jal print_comb
  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  jr $ra

  cont:
  addiu $t0, $0, 0
  
  for_ci:
  slt $t1, $t0, $a2
  beq $t1, $0, exit_for_ci
  la $t1, d
  subu $t2, $a1, $a3
  addu $t1, $t1, $t2
  addu $t2, $a0, $t0
  lbu $t2, ($t2)
  sb $t2, ($t1)
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a0, 56($sp)
  sw $a1, 52($sp)
  sw $a2, 48($sp)
  sw $a3, 44($sp)
  sw $t0, 40($sp)
  addiu $a3, $a3, -1
  jal combinations_impl
  lw $ra, 60($sp)
  lw $a0, 56($sp)
  lw $a1, 52($sp)
  lw $a2, 48($sp)
  lw $a3, 44($sp)
  lw $t0, 40($sp)
  addiu $sp, $sp, 64
  addiu $t0, $t0, 1
  j for_ci

  exit_for_ci:
  jr $ra

.globl combinations
combinations:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a0, 56($sp)
  sw $a1, 52($sp)
  sw $a2, 48($sp)
  addu $a0, $0, $a2
  jal malloc
  la $t0, d
  sw $v0, ($t0)
  lw $a0, 56($sp)
  lw $a1, 48($sp)
  lw $a2, 52($sp)
  lw $a3, 48($sp)
  jal combinations_impl

  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra
