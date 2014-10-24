#Luke Welna

.globl main
.data

insert: 
	.word 4
	
AskInput:
	.asciiz "Please enter an int to add\n"
	
AskInput2:
	.asciiz "Please enter a second int to add\n"

resultOf:
	.asciiz "The result of "
plus: 
	.asciiz " plus "
is: 
	.asciiz " is "
.text
main:

# ---------- prompt for first input -------------

la $a0, AskInput  	#	load string of AskInput into $a0
li $v0, 4			#	tells the console to print the string in $a0
syscall				# 	prints the string in $a0

li $v0, 5			# tells syscall to read an int from console
syscall				# int is in $v0
add $t0, $0, $v0	# stores the value in $v0 in $t0

#----------- prompt for second input -------------

la $a0, AskInput2  #	load address of Ask_Input into $a0
li $v0, 4			#	tells the console to print the string in $a0
syscall				# 	prints the string in $a0

li $v0, 5			# tells syscall to read an int from console
syscall				# int is in $v0
add $t1, $0, $v0	# stores the value in $v0 in $t0

#----------- print result ------------------

la $a0, resultOf	# loads resultOf string into $a0
li $v0, 4			#print string in $a0
syscall

add $a0, $t0, $0	#$a0 = $t0
li $v0, 1			#print int in $a0
syscall

la $a0, plus		#loads plus string into $a0
li $v0, 4			#print string in $a0
syscall

add $a0,$t1,$0		#$a0 = $t1
li $v0, 1			#print int in $a0
syscall

la $a0, is			#loads is string into $a0
li $v0, 4			#print string in $a0
syscall

add $a0, $t0, $t1	#$a0 = $t0, $t1
li $v0, 1			#print int in $a0
syscall


li $v0, 10			#end program
syscall