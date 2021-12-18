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

main:    ori   $t2, $zero, 0x11     # counter == 3

inRe:    lui   $t0, 0xffff
         lw    $t1, 0($t0)          # load from the input control register
         andi  $t1, $t1, 0x001      # reset all bits except lowest order bit
         beq   $t1, $zero, inRe     # if not ready yet, then loop again
         lw    $v0, 4($t0)          # if input ready, read

outWr:   lw    $t1, 8($t0)
         andi  $t1, $t1, 0x0001
         beq   $t1, $zero, outWr
         sw    $v0,  12($t0)

