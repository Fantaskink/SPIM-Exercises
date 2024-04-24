    .text
main:
  li $t0, 1 # True
  li $t1, 0 # False
  and $t2, $t0, $t1 # True && False
  move $a0, $t2
  jal print_boolean

  li $t0, 4
  li $t1, 4

  bne $t0, $t1, if_block_1  # 3 <> 4

  j else_block_1

else_block_1:
  li $t0, 14
  move $a0, $t0

  j end_if_1

if_block_1:
  li $t0, 10
  li $t1, 2

  mul $t2, $t0, $t1
  move $a0, $t2

end_if_1:
  jal print_integer

  
  li  $v0, 10 # exit
  syscall

print_boolean:
  move $t0, $a0 # Load function argument into $t0
  beq $t0, 0, print_false
  beq $t0, 1, print_true
  jr $ra

print_integer: 
  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  jr $ra

print_true:
  li $v0, 4
  la $a0, true
  syscall
  jr $ra

print_false:
  li $v0, 4
  la $a0, false 
  syscall
  jr $ra

    .data
true: .asciiz "True\n"
false:  .ascii "False\n"
