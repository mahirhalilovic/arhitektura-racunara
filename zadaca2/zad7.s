.section .text
.globl mymax
mymax:
  # $f12 - start, $a2 - nums, $a3 - size

  addiu $t0, $0, 0

  for:
  slt $t1, $t0, $a3
  beq $t1, $0, exit

  sll $t1, $t0, 3
  addu $t1, $a2, $t1
  ldc1 $f2, ($t1)
  c.lt.d $f12, $f2
  bc1f cont

  ldc1 $f12, ($t1)
  
  cont:
  addiu $t0, $t0, 1
  j for

  exit:
  mov.d $f0, $f12
  jr $ra
