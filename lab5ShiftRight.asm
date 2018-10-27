	.data
str1:	.asciiz "The unshifed value: "
str2:	.asciiz "\nThe shifted value: "
val:	.word 48768

	.text
	

main:
	lw $s0, val
	
	#Shift
	srl $s1, $s0, 7

	#print both values
	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 4
	la $a0, str2
	syscall

	li $v0, 1
	move $a0, $s1
	syscall

	#EXIT
	li $v0, 10
	syscall