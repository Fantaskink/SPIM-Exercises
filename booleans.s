    .text
main:
  li $t0, 1 # True
  li $t1, 0 # False
  and $t2, $t0, $t1 # True && False
  move $a0, $t2
  jal print_boolean

  li  $v0, 10 # exit
  syscall

print_boolean:
  move $t0, $a0 # Load function argument into $t0
  beq $t0, 0, print_false
  beq $t0, 1, print_true
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
