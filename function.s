.data

.text

main:
    li $t0, 5

    move $a0, $t0
    jal square
    move $t1, $v0

    li $v0, 1
    move $a0, $t1 # move result to stdout
    syscall
    
    li $v0, 10
    syscall

square:
    sub $sp, $sp, 8 # 1 argument + 1 return address
    sw $ra 4($sp)   # save return address on stack
    sw $a0, 0($sp)  # save argument on stack

    lw      $a0, 0($sp)   # Load the argument from the stack
    mul     $v0, $a0, $a0 # Multiply $a0 by itself, result in $v0

    lw      $ra, 4($sp)   # Restore the return address from the stack
    addi    $sp, $sp, 8   # Deallocate space on the stack
    jr      $ra           # Return to the caller
