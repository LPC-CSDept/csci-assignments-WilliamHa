//
// quiz1submit.asm
//
// William Ha
// 11/23/2021
// CSCI-21
// 
//

      .data
sub:  .float 32.0
mul:  .float 5.0
div:  .float 9.0
pr:   .asciiz "Enter the Temperature in Fahrenheit: "
      .text
      .globl main

main: jal   getInt
      sll   $zero, $zero, 0
      li v0, 10
      syscall      

getInt:  li $v0, 4
         la $a0, pr
         syscall
         li $v0, 5
         syscall
         jr $ra
         sll $zero, $zero, 0

calcC:   