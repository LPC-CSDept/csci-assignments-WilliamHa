#
# q5.asm
#
# William Ha
# 12/17/2021
# Keith Mehl
# CSCI-21
#

   .data
   .text
   .globl main

main: lui   $t0, 0xffff
      lw    $t1, 0($t0)
      andi  $t1, $t1, 0x001
      beq   $t1, $zero, main
      lw    $v0,  4($t0)
      