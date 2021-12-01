#
# quiz1submit.asm
#
# William Ha
# 11/23/2021
# CSCI-21
# 
#

	      .data
val1:  	.float 32.0
val2:  	.float 5.0
val3:	   .float 9.0
pr:   	.asciiz "Enter the Temperature in Fahrenheit: "
nl:      .asciiz "\n"
         .text
         .globl main

main: 	jal	getInt			   #subroutine gets user input of Fahrenheit in integers
         sll	$zero, $zero, 0
         mtc1	$v0, $f1		      #puts the user input into the floating point register
         cvt.s.w	$f0, $f1		   #so that it can be converted into a floating point double 
         l.s	$f1, val1		   #$f1 = 32.0
         sll	$zero, $zero, 0
         sub.s	$f0, $f0, $f1		#$f0 = userinput - 32.0
         l.s 	$f1, val2		   #$f1 = 5.0
         sll	$zero, $zero, 0
         mul.s	$f0, $f0, $f1		#$f0 = (input - 32.0) * 5.0
         sll	$zero, $zero, 0
         sll	$zero, $zero, 0
         l.s 	$f1, val3		   #$f1 = 9.0
         sll	$zero, $zero, 0
         div.s	$f0, $f0, $f1		#$f0 = ((input - 32.0) * 5.0 / 9.0) = C
         sll	$zero, $zero, 0
         sll	$zero, $zero, 0
         li    $v0, 2
         mov.s $f12, $f0
         syscall
         li    $v0, 4
         la    $a0, nl
         syscall
         li	$v0, 10			      #syscall service code to end program
         syscall      

getInt:	li    $v0, 4
         la    $a0, pr
         syscall
         li    $v0, 5
         syscall
         jr    $ra
         sll   $zero, $zero, 0