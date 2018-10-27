	.data
prompt:	.asciiz	"Enter the numbers to sum: "
prompt1:.asciiz	"The final value is: "
k:	.word	0
answer:	.word	0

	.text

main:
	li	$v0,	4		#prompt for input
	la	$a0,	prompt
	syscall

	li 	$v0, 	5		#read in value
	syscall
	add 	$a0,	$v0,	$zero


	jal funct			#jump to function		
	add	$t1,	$v0,	$zero	#move to temp reg
	
	li	$v0,	4		#print answer
	la	$a0,	prompt1
	syscall

	li	$v0,	1
	add 	$a0,	$t1,	$zero
	syscall

	li	$v0,	10		#exit
	syscall




funct:	add	$v0,	$zero,	0
	add	$t0,	$zero,	0

loop:	slt	$t1,	$t0,	$a0

	beq	$t1,	$zero,	retrn
	add	$v0,	$v0,	$t0
	addi	$t0,	$t0,	1

	j loop
retrn:	jr $ra