    .text
main:
  lw $t0, x # load word x into $t0
  mul $t1, $t0, $t0
  sw $t1, y # store value of $t1 in word y
  
  lw $a0, y
  jal print_integer

  li $v0, 10 # exit
  syscall

print_integer: 
  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  jr $ra

    .data
x: .word 2
y: .word 0
