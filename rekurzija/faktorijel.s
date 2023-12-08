.section .text
.globl fact
fact:
  bne $a0, $0, rekurzija
  addiu $v0, $0, 1
  jr $ra

rekurzija:
  addiu $sp, $sp, -64
  sw $ra, 60($sp) # $ra
  sw $a0, 56($sp) # n
  addiu $a0, $a0, -1
  jal fact
  lw $t0, 56($sp)
  mult $t0, $v0 # rezultat mnozenja u LO
  mflo $v0
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra

# int fact(int n) { return n * fact(n - 1); }
