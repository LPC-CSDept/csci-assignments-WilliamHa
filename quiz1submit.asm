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

main: jal      getInt               #subroutine gets user input of Fahrenheit in integers
      sll      $zero, $zero, 0
      sll      $f2, $v0, 0          #puts the user input into the floating point register
      cvt.d.w  $f0, $f2             #so that it can be converted into a floating point double 
      l.d      $f2, sub             #$f2 = 32.0
      sub.d    $f0, $f0, $f2        #$f0 = userinput - 32.0
      l.d      $f2, mult            #$f2 = 5.0
      mul.d    $f0, $f0, $f2        #$f0 = (input - 32.0) * 5.0
      sll      $zero, $zero, 0
      sll      $zero, $zero, 0
      l.d      $f2, div             #$f2 = 9.0
      div.d    $f0, $f0, $f2
      sll      $zero, $zero, 0
      sll      $zero, $zero, 0
      li       v0, 10               #syscall service code to end program
      syscall      

getInt:  li    $v0, 4
         la    $a0, pr
         syscall
         li    $v0, 5
         syscall
         jr    $ra
         sll   $zero, $zero, 0