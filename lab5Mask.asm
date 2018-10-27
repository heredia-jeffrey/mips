	.data
str:	.asciiz "Enter initial value: "
str1:	.asciiz "\nThe initial value is: "
str2:	.asciiz "\nThe masked value is: "
str3:	.asciiz "\nThe shifted masked value is: "


val:	.word 0
mask:	.word 63

	.text

main:
	#load init. val.
	lw $s0, val
	lw $s1, mask

	#read val from user
	li $v0, 5
	syscall
	move $s0, $v0

	
	#Print val
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall

	
	#Mask val (bits 9 - 13)
	sll $t0, $s1, 9
	and $s3, $t0, $s0

	#Print masked val
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall

	#shift masked val 10
	sll $s4, $s3, 10

	#Print shifted masked value
	li $v0, 4
	la $a0, str3
	syscall

	li $v0, 1
	move $a0, $s4
	syscall

	#EXIT
	li $v0, 10
	syscall