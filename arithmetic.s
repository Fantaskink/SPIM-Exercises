    .text
main: 
  li $t0, 4
  add $a0, $t0, 6 # 4 + 6

  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  li $t1, 21
  li $t2, 2

  mul $a0, $t1, $t2 # 21 * 2
  
  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  li $t1, 7
  li $t2, 2

  div $t1, $t2

  mflo $t3

  li $t4, 4

  add $a0, $t4, $t3

  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  li $t0, 10
  li $t1, 5
  div $t0, $t1  # 10 / 5
  mflo $t0  # Move result of division into $t0
  
  li $t1, 6
  mul $t0, $t1, $t0 # 6 * $t0

  li $t1, 3

  sub $a0, $t1, $t0 # 3 - $t0

  li $v0, 1 # Load syscall code 1 (print integer) into $v0
  syscall

  # Print a newline
  li $v0, 11              # Load syscall code 11 (print character) into $v0
  li $a0, '\n'            # Load ASCII value of newline character into $a0
  syscall                 # Perform syscall to print the character

  li $v0, 10
  syscall
