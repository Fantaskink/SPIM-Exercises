    .text
main:
    li $t0, 1
    li $v1, 1
    li $a1, 6

loop:
    bgt $t0, $a1, stop
    mul $v1, $v1, $t0
    addi $t0, $t0, 1
    j loop

stop:
    move $a0, $v1 
    jal print_int
    li $v0, 10
    syscall

print_int:
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    jr $ra

    .data
newline:.asciiz "\n"