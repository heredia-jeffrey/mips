	.data
str1:	.asciiz "I will creat a magic number between 0 and 9 inclusize and ask you to guess it: "
str2:	.asciiz "Enter your guess: "
str3:	.asciiz "Too big! guess again!: "
str4:	.asciiz "Too small guess again: "
str5:	.asciiz "Your right!"
rand:	.word 5
input:	.word 0
	.text



main:
	lw $s0, rand
	lw $s1, input


	#introduction
	li $v0, 4
	la $a0, str1
	syscall

	#Prompt
	li $v0, 4
	la $a0, str2
	syscall

	#read input
	li $v0, 5
	syscall
	move $s1, $v0
	
loop:
	

	blt $s0,$s1, lbl1



	bgt $s0, $s1, lbl2


	#if input == rand exit
	bne $s0,$s1 loop


	#your right.. yay
	li $v0, 4
	la $a0, str5
	syscall

	#exit
	li $v0, 10
	syscall
lbl1:
	#if val is to large
	li $v0, 4
	la $a0, str3
	syscall

	la $v0, 5
	syscall
	move $s1, $v0
	j loop

lbl2:
	#if val is to low
	li $v0, 4
	la $a0, str4
	syscall

	la $v0, 5
	syscall
	move $s1, $v0
	j loop
