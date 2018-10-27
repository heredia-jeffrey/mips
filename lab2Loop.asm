

	.data
x:	.word 0
y:	.word 0
z:	.word 3
prompt:	.asciiz "enter the value to be added "
str1: 	.asciiz	"enter the value to be multiplied "
newline: .asciiz "\n"
	.text

main:
	lw $s0, x
	lw $s1, y
	lw $s2, z


loop:
	#prompt for input
	li $v0, 4
	la $a0, prompt
	syscall

	#read in the value
	li $v0, 5
	syscall
	move $s0, $v0

	#add the values 
	add $s1, $s0, $s1

	#decrement loop and branch if not negative
	sub $s2, $s2, 1
	bgez $s2, loop

	#prompt user for next value 
	li $v0, 4
	la $a0, str1
	syscall
	
	#read in the value
	li $v0, 5
	syscall
	move $s0, $v0

	#multiply the values
	mult $s0, $s1
	mflo $s1
	mfhi $s3

	#output the result
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall

	#exit
	li $v0, 10
	syscall



	
