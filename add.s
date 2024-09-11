.text
main: 
    li $t0, 10
    li $t1, 5
    add $t0, $t0, $t1

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall