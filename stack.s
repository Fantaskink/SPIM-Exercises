    .text
main:
  jal print_1

  li $v0, 10 # exit
  syscall

print_1:
  sub $sp, $sp, 4 # Make room for 1 word on the stack
  li $t0, 3
  sw $t0, 0($sp) # store x on the stack

  lw $t0, 0($sp) # load x
  mul $t1, $t0, $t0

  move $a0, $t1
  jal print_integer

  addi $sp, $sp, 4 # Restore the stack pointer

  jr $ra

print_integer: 
  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  jr $ra

    .data
