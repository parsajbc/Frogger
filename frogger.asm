.data
	displayAddress: .word 0x10008000

.text

rs:	li $v0, 32
li $s0, 1
li $s1, 128
li $t8, 0
li $t9, 0
li $t3, 0
li $s2, 3636
li $s3, 3
li $s4, 12
li $s5, 0

lw $t2, displayAddress
addi $t2, $t2, 896
lw $t0, displayAddress

grass:	li $t1, 0x00ff00
	lw $t5, displayAddress
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, grass

score:	li $t1, 0xcc6633
	li $t5, 484
	lw $t7, displayAddress
	add $t7, $t7, $t5
	li $t0, 5

score2:	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 104
	subi $t0, $t0, 1
	beq $t0, $zero, start
	j score2
	

start:	li  $a0, 17
	lw $t0, displayAddress # $t0 stores the base address for display
	lw $t2, displayAddress
	addi $t2, $t2, 384
	li $t6, 12
	
	

#   ======================================================================================================
#           First we will draw out the map as done bellow
#   ======================================================================================================

d1:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d1
	
add $t1, $zero, $s3
lw $t7, displayAddress
li $t5, 0xcc0033
addi $t7, $t7, 4
lives:	sw $t5, 0($t7)
	addi $t7, $t7, 8
	sw $t5, 0($t7)
	addi $t7, $t7, 120
	sw $t5, 0($t7)
	addi $t7, $t7, 4
	sw $t5, 0($t7)
	addi $t7, $t7, 4
	sw $t5, 0($t7)
	addi $t7, $t7, 124
	sw $t5, 0($t7)
	subi $t1, $t1, 1
	beq $t1, $zero, score3
	subi $t7, $t7, 244
	j lives

#=======================================================
# here we write the score
#=======================================================

score3:	li $t1, 0x000000
	beq $s5, 4, s_top
	beq $s5, 1, s_top
	lw $t7, displayAddress
	add $t7, $t7, 108
	sw $t1, 0($t7)
	add $t7, $t7, 4
	sw $t1, 0($t7)
	
s_top:	beq $s5, 5, s_tr
	beq $s5, 6, s_tr
	lw $t7, displayAddress
	add $t7, $t7, 244
	sw $t1, 0($t7)
	add $t7, $t7, 128
	sw $t1, 0($t7)
	
s_tr:	beq $s5, 2, s_br
	lw $t7, displayAddress
	add $t7, $t7, 628
	sw $t1, 0($t7)
	add $t7, $t7, 128
	sw $t1, 0($t7)
	
s_br:	beq $s5, 0, s_m
	beq $s5, 1, s_m
	beq $s5, 7, s_m
	lw $t7, displayAddress
	add $t7, $t7, 492
	sw $t1, 0($t7)
	add $t7, $t7, 4
	sw $t1, 0($t7)
	
s_m:	beq $s5, 1, s_tl
	beq $s5, 2, s_tl
	beq $s5, 3, s_tl
	beq $s5, 7, s_tl
	lw $t7, displayAddress
	add $t7, $t7, 232
	sw $t1, 0($t7)
	add $t7, $t7, 128
	sw $t1, 0($t7)
	
s_tl:	beq $s5, 1, s_bl
	beq $s5, 3, s_bl
	beq $s5, 4, s_bl
	beq $s5, 7, s_bl
	beq $s5, 9, s_bl
	beq $s5, 5, s_bl
	lw $t7, displayAddress
	add $t7, $t7, 616
	sw $t1, 0($t7)
	add $t7, $t7, 128
	sw $t1, 0($t7)
	
s_bl:	beq $s5, 1, c
	beq $s5, 4, c
	beq $s5, 7, c
	lw $t7, displayAddress
	add $t7, $t7, 876
	sw $t1, 0($t7)
	add $t7, $t7, 4
	sw $t1, 0($t7)
	
#=======================================================
#=======================================================
			
c:	add $t2, $t2, 512

d2:	li $t1, 0x00ff00
	lw $t5, displayAddress
	sub $t5, $t0, $t5
	rem $t5, $t5, $s1
	beq $t5, $zero, help2
	beq $t5, 124, help2
	lw $t4, 0($t0)
	beq $t4, 0x000000, help2
	beq $t4, 0xcc6633, help2
	beq $t4, 0xcc0099, help2
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d2
	
j h2

help2:	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d2
	
h2:	addi $t2, $t2, 128
	
d3:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d3
	
addi $t2, $t2, 896

#   ======================================================================================================
#           up until this point we have drawn the grass and water part at the top (inclusing the orange sidewalks).
#	    now we draw the logs in the water before proceeding with the rest of the map.
#   ======================================================================================================
	
log:	# first log going to the right 
	add $t5, $zero, $zero
	add $t5, $t5, $t8
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	add $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 8
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass1
	beq $t7, 124, pass1
	
	li $t7, 0x3366ff
	beq $t6, 1, water1
	li $t7, 0x660000
water1:	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass1:	# second log going to the right 
	add $t5, $zero, $zero
	add $t5, $t5, $t8
	addi $t5, $t5, 64
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	add $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 8
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass2
	beq $t7, 124, pass2
	
	li $t7, 0x3366ff
	beq $t6, 1, water2
	li $t7, 0x660000
water2:	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass2:	# first log going to the left 
	sub $t5, $zero, $t8
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	sub $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 15
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass3
	beq $t7, 124, pass3
	
	li $t7, 0x3366ff
	beq $t6, 1, water3
	li $t7, 0x660000
water3:	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass3:	# second log going to the left 
	sub $t5, $zero, $t8
	subi $t5, $t5, 64
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	sub $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 15
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass4
	beq $t7, 124, pass4
	
	li $t7, 0x3366ff
	beq $t6, 1, water4
	li $t7, 0x660000
water4:	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	
	
pass4:	subi $t6, $t6, 1
	beq $t6, $zero, cnt
	j log

# if all the logs have been drawn we continue
cnt:	beq $t3, $zero, cnt3
	j d4
	
cnt3:	addi $t8, $t8, 4
	rem $t8, $t8, $s1

#   ======================================================================================================
#           now we keep drawing the rest of the map
#   ======================================================================================================

d4:	li $t1, 0x3366ff
	lw $t5, displayAddress
	sub $t5, $t0, $t5
	rem $t5, $t5, $s1
	lw $t7, 0($t0)
	beq $t7, 0x660000, help4
	beq $t5, $zero, help4
	beq $t5, 124, help4
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d4
	
j cnt2

help4:	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d4
			
		
cnt2:	addi $t2, $t2, 128
	
d5:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d5

addi $t2, $t2, 384
	
d6:	li $t1, 0xffff33
	lw $t5, displayAddress
	sub $t5, $t0, $t5
	rem $t5, $t5, $s1
	beq $t5, $zero, help6
	beq $t5, 124, help6
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d6
	
j h6

help6:	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d6
	
h6:	addi $t2, $t2, 128
	
d7:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d7
	
addi $t2, $t2, 896

h8:	li $t6, 12

#   ======================================================================================================
#           up to this point the mid safe zone and road have also been drawn.
#	    we will draw cars first before finally finishing the map.
#   ======================================================================================================
	
car:	# first car going right
	add $t5, $zero, $zero
	add $t5, $t5, $t9
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	add $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 20
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass5
	beq $t7, 124, pass5
	
	li $t7, 0x330000
	beq $t6, 5, road1
	li $t7, 0x99ffff
road1:	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass5:	# second car going right
	add $t5, $zero, $zero
	add $t5, $t5, $t9
	addi $t5, $t5, 64
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	add $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 20
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass6
	beq $t7, 124, pass6
	
	li $t7, 0x330000
	beq $t6, 5, road2
	li $t7, 0x99ffff
road2:	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	addi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass6:	# first car going left
	sub $t5, $zero, $t9
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	sub $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 27
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass7
	beq $t7, 124, pass7
	
	li $t7, 0x330000
	beq $t6, 5, road3
	li $t7, 0x99ffff
road3:	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	
pass7:	# second car going left
	sub $t5, $zero, $t9
	subi $t5, $t5, 64
	li $t7, 4
	mult $t7, $t6
	mflo $t7
	sub $t5, $t5, $t7
	lw $t1, displayAddress
	addi $t7, $zero, 27
	mult $t7, $s1
	mflo $t7
	add $t1, $t1, $t7
	rem $t5, $t5, $s1
	add $t5, $t5, $t1
	
	lw $t7, displayAddress
	sub $t7, $t5, $t7
	rem $t7, $t7, $s1
	beq $t7, 0, pass8
	beq $t7, 124, pass8
	
	li $t7, 0x330000
	beq $t6, 5, road4
	li $t7, 0x99ffff
road4:	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	subi $t5, $t5, 128
	sw $t7, 0($t5)
	
	
pass8:	subi $t6, $t6, 1
	beq $t6, 4, cnt1
	j car


# continue with the rest of the program
cnt1:	beq $t3, $zero, cnt4
	j d8
	
cnt4:	addi $t9, $t9, 4
	rem $t9, $t9, $s1

#   ======================================================================================================
#           the cars have now also been drawn so we proceed with the rest of the map
#   ======================================================================================================

d8:	li $t1, 0x330000
	lw $t5, displayAddress
	sub $t5, $t0, $t5
	rem $t5, $t5, $s1
	lw $t7, 0($t0)
	beq $t7, 0x99ffff, help8
	beq $t5, $zero, help8
	beq $t5, 124, help8
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d8
	
j cnt5

help8:	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d8

cnt5:	addi $t2, $t2, 128
	
d9:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d9
	
addi $t2, $t2, 384
	
d10:	li $t1, 0x00ff00
	lw $t5, displayAddress
	sub $t5, $t0, $t5
	rem $t5, $t5, $s1
	beq $t5, $zero, help10
	beq $t5, 124, help10
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d10
	
j h10

help10:	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d10
	
h10: 	addi $t2, $t2, 128
	
d11:	li $t1, 0xcc6633
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	slt $t7, $t0, $t2
	beq $t7, $s0, d11
	
#	    I also added a border:

lw $t7, displayAddress
li $t5, 32
border:	li $t1, 0xcc6633
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	beq $t5, $zero, Lcheck
	subi $t5, $t5, 1
	j border

#   ======================================================================================================
#           The map has now been fully drawn.
#	    now we will check to see if the frog is at a position that would result in it dying (lol).
#	    if the center of the frog is on water or car then it loses.
#   ======================================================================================================

Lcheck:	lw $t7, displayAddress
	add $t7, $t7, $s2
	addi $t7, $t7, 132
	lw $t7, 0($t7)
	beq $t7, 0x99ffff, death
	beq $t7, 0x3366ff, death

#   ======================================================================================================
#	    First we check to see if the frogs location should be updated.
#   ======================================================================================================

loc:	lw $t7, 0xffff0000
	beq $t7, 1, check
	j frog
	
#	This checks to see which key has been pushed.
check:	lw $t7, 0xffff0004
	beq $t7, 0x61, ac_a
	beq $t7, 0x64, ac_d
	beq $t7, 0x73, ac_s
	beq $t7, 0x77, ac_w	
	
ac_a:	rem $t7, $s2, $s1
	beq $t7, 4, frog
	lw $t7, displayAddress
	add $t7, $t7, $s2
	subi $s7, $s7, 12
	lw $t7, 0($t7)
	beq $t7, 0xcc0099, frog
	subi $s2, $s2, 12
	j Lcheck1
	
ac_d:	rem $t7, $s2, $s1
	beq $t7, 112, frog
	lw $t7, displayAddress
	add $t7, $t7, $s2
	addi $s7, $s7, 12
	lw $t7, 0($t7)
	beq $t7, 0xcc0099, frog
	addi $s2, $s2, 12
	j Lcheck1
	
ac_s:	rem $t7, $s2, $s1
	sub $t7, $s2, $t7
	li $t5, 128
	div $t7, $t5
	mflo $t7
	beq $t7, 28, frog
	addi $s2, $s2, 512
	j Lcheck1
	
ac_w:	rem $t7, $s2, $s1
	sub $t7, $s2, $t7
	li $t5, 128
	div $t7, $t5
	mflo $t7
	beq $t7, 4, frog
	lw $t7, displayAddress
	add $t7, $t7, $s2
	subi $t7, $t7, 512
	addi $t7, $t7, 4
	lw $t7, 0($t7)
	beq $t7, 0xcc0099, frog
	beq $t7, 0xcc6633, frog
	subi $s2, $s2, 512
	j Lcheck1


#   ======================================================================================================
#	    Before drawing the frog we check once more to see if the new position of the frog results in loss.
#	    We also check to see if the frog has reached an empty goal region.
#   ======================================================================================================

Lcheck1:	lw $t7, displayAddress
	add $t7, $t7, $s2
	addi $t7, $t7, 132
	lw $t7, 0($t7)
	beq $t7, 0x99ffff, death
	beq $t7, 0x3366ff, death
	
	slti $t7, $s2, 768
	beq $t7, 1, win

#   ======================================================================================================
#	    Now we draw the frog with the following "X" design.
#   ======================================================================================================

frog:	lw $t7, displayAddress
	add $t7, $s2, $t7
	li $t1, 0x339933
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)


#   ======================================================================================================
#	    This allows me to controll how fast the objects move
addi $t3, $t3, 1
rem $t3, $t3, $s4
#   ======================================================================================================

syscall
j score


win:	addi $s5, $s5, 1
	subi $s4, $s4, 1
	subi $t7, $s2, 128
	lw $t1, displayAddress
	add $t7, $t7, $t1
	li $t1, 0xcc0099
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 120
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 120
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 120
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	lw $t7, displayAddress
	addi $t7, $t7, 648
	
	li $v0, 33
	add $a0, $t0, $zero
	li $a1, 1000
	li $a2, 4
	li $a3, 50
	syscall
	li $v0, 32
	li $a0, 1
	syscall
	
EndWin:	lw $t1, 0($t7)
	beq $t1, 0x00ff00, NotWin
	lw $t1, displayAddress
	addi $t1, $t1, 736
	addi $t7, $t7, 4
	slt $t1, $t7, $t1
	beq $t1, 1, EndWin
	add $s3, $zero, $zero
	
NotWin:	li $s2, 3636
	li $t7, 0
	li $t1, 0x00cc33
	j r1

death:	lw $t7, displayAddress
	add $t7, $s2, $t7
	li $t1, 0x339933
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)

	li $v0, 33
	li $t7, 90
	add $a0, $t7, $zero
	li $a1, 1000
	li $a2, 58
	li $a3, 50
	syscall
	subi $a0, $t7, 1
	syscall
	subi $a0, $t7, 2
	li $a1, 2000
	syscall
	li $v0, 32
	li $a0, 1
	syscall
	
	subi $s3, $s3, 1
	li $s2, 3636
	li $t7, 0
	li $t1, 0x990033
	j r1
	
r1:	addi $t7, $t7, 4
	lw $t5, displayAddress
	add $t7, $t7, $t5
	lw $t4, 0($t7)
	beq $t4, 0xcc0099, skip
	sw $t1, 0($t7)
skip:	sub $t7, $t7, $t5
	slti  $t5, $t7, 4096
	beq $t5, $s0, r1
	
lw $t7, displayAddress
li $t5, 32
b1:	li $t1, 0xcc6633
	sw $t1, 0($t7)
	addi $t7, $t7, 124
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	beq $t5, $zero, b2
	subi $t5, $t5, 1
	j b1

b2:	lw $t7, displayAddress
	li $t5, 32
b3:	li $t1, 0xcc6633
	sw $t1, 0($t7)
	addi $t7, $t7, 3968
	sw $t1, 0($t7)
	subi $t7, $t7, 3964
	beq $t5, $zero, r2
	subi $t5, $t5, 1
	j b3	
	
r2:	beq $s3, $zero, option1
	li  $a0, 1300
	syscall
	j score

option1: lw $t7, displayAddress
	addi $t7, $t7, 1840
	li $t1, 0x000000
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 12
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	
	addi $t7, $t7, 100
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)
	addi $t7, $t7, 12
	sw $t1, 0($t7)
	
	addi $t7, $t7, 108
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 12
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	
	addi $t7, $t7, 100
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 16
	sw $t1, 0($t7)
	
	addi $t7, $t7, 108
	sw $t1, 0($t7)
	addi $t7, $t7, 8
	sw $t1, 0($t7)
	addi $t7, $t7, 12
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	addi $t7, $t7, 4
	sw $t1, 0($t7)
	
	lw $t7, 0xffff0000
	beq $t7, 1, op2
	li  $a0, 1300
	syscall
	j option1
	
op2:	lw $t7, 0xffff0004
	beq $t7, 0x65, Exit
	beq $t7, 0x72, rs
	j option1	
	
			
Exit: 	li $v0, 10 # terminate the program gracefully
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
