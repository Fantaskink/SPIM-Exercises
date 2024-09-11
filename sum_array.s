.data
array:  .word 100, 3, 5, 7, 6
length: .word 5
sum: .word 0    
newline: .asciiz "\n"
    
.text
main: 
    lw $t0, length
    la $t1, array
    li $t2, 0       # Initalize sum to 0
    li $t3, 0       # Initialize counter to 0

loop:
    beq $t0, $t3, end   # if counter == length, end
    
    # Load array element
    lw $t4, 0($t1)

    add $t2, $t2, $t4   # sum += array[i]
    add $t3, $t3, 1     # counter++
    addi $t1, $t1, 4     # add 4 to array pointer. 4 bytes = size of int

    j loop

end:

    li $v0, 1 # print int
    move $a0, $t2 # move sum to stdout
    syscall

    li $v0, 4 # print ascii
    la $a0, newline
    syscall

    li $v0, 10
    syscall