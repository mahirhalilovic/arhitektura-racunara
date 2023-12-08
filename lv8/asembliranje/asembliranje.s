# Implementirati main u MIPS assembly-u. Nakon toga ručno asemblirati
# instrukcije u njihovu masinsku reprezentaciju.
#
#
#int foo(int a, int b);
#
#int main(int argc, char *argv[]) {
#  int a = 40000;
#  int b = 75;
#  int res = foo(a, b);
#  if (res % 2 == 0) {
#    res *= 6;
#  } else {
#    res *= 16;
#  }
#  printf("%d\n", res);
#  return 0;
#}
.data
str: .asciiz "%d\n"
.text
.globl main
main:
  addiu $sp, $sp, -20             # 0x27BDFFEC
  sw $ra, 16($sp)                 # 0xAFBF0010
 L1:
  ori $a0, $zero, 40000           # ?
  addiu $a1, $zero, 74            # ?

  jal foo                         # 0x0C100164
  nop

  addu $t0, $v0, $zero            # 0x00404021
  addiu $t1, $zero, 2             # ?
  
  mfhi $t5                        # 0x00004010
  bne $t0, $zero, L1              # 0x15000006
  nop

  sll $t0, $v0, 1                 # 0x00024040
  sll $t1, $v0, 2
  addu $a1, $t0, $t1
  j kraj                          # ?
 else:
  sll $a1, $v0, 4
 kraj:
  la $a0, str
  jal printf

  lw $ra, 16($sp)
  addiu $v0, $zero, 0
  addiu $sp, $sp, 20
  jr $ra



