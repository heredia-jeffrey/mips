	.data
prompt:	.asciiz "Enter two integers between 1 and 1000: "
prompt1:.asciiz "The product of the two integers is "
i:	.word 0
product:.word 0

	.text

main:

	li $v0, 4		# Prompt for input
	la, $a0, prompt
	syscall

	li $v0, 5		#read in var
	syscall
	add $t0, $v0, $zero

	li $v0, 5		#read in 2nd var
	syscall
	add $t1, $v0, $zero

	add $a0, $t0, $zero	#store vars in $a registers
	add $a1, $t1, $zero

	jal Multiply
	add $t3, $v0, $zero

	li $v0, 4		#output answer
	la $a0, prompt1
	syscall

	li $v0, 1
	add $a0, $t3, $zero
	syscall

	li $v0, 10		#exit
	syscall



Multiply:

	addi $sp, $sp, -4	#push on the stack
	sw $ra, 0($sp)

	lw $t0, i		#loading static variables
	lw $t1, product

Loop:	
	slt $t3, $t0, $a0
	beq $t3, $zero, Return
	add $t1, $t1, $a1
	addi $t0, $t0, 1
	j Loop
	
Return:
	lw $ra, 0($sp)		#poppin the stack
	addi $sp, $sp, 4

	add $v0, $t1, $zero	#setting return variable and returning to main
	jr $ra