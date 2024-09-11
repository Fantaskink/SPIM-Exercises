.data
INPUT: .word 25

.text

main:
    lw $t0, INPUT

    move $a0, $t0
    jal sqrt
    move $t1, $v0

    li $v0, 1
    move $a0, $t1 # move result to stdout
    syscall
    
    li $v0, 10
    syscall

sqrt:
    sub $sp, $sp, 8 # 1 argument + 1 return address
    sw $ra 4($sp)   # save return address on stack
    sw $a0, 0($sp)  # save argument on stack

    lw      $a0, 0($sp)   # Load the argument from the stack
    move $t0, $a0
    
    li $t1, 0 # c = 0
    li $t2, 1 # s = 1
loop:
    bgt $t2, $t0, stop

    addi $t1, $t1, 1 # c++
    mul $t3, $t1, 2 # 2c
    addi $t3, $t3, 1 # 2c + 1
    add $t2, $t2, $t3 # s = s + 2c + 1
    j loop

stop:
    move $v0, $t1

    lw      $ra, 4($sp)   # Restore the return address from the stack
    addi    $sp, $sp, 8   # Deallocate space on the stack
    jr      $ra           # Return to the caller
