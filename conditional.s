.data
INT1: .word 5
INT2: .word 5

.text
main:
    lw $t0, INT1
    lw $t1, INT2
    li $t2, 0

    beq $t0, $t1, equal
    j not_equal

equal:
    li $t2, 1

not_equal:
    li $v0, 1
    move $a0, $t2 # move result to stdout
    syscall
    
    li $v0, 10
    syscall