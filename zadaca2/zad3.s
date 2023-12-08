.section .rodata
threehalfs: .float 1.5

.section .text
.globl Q_rsqrt
Q_rsqrt:
  lui $t0, 0x3f00
  mtc1 $t0, $f4
  mul.s $f4, $f4, $f12
  mfc1 $t0, $f12
  srl $t0, $t0, 1
  lui $t1, 0x5f37
  ori $t1, $t1, 0x59df
  subu $t0, $t1, $t0
  mtc1 $t0, $f6
  mul.s $f8, $f6, $f6
  mul.s $f8, $f8, $f4
  la $t1, threehalfs
  lwc1 $f2, ($t1)
  sub.s $f0, $f2, $f8
  mul.s $f0, $f0, $f6
  jr $ra
