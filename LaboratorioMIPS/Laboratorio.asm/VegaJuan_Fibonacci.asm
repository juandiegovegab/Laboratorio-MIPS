.data
    mensaje_pedir: .asciiz "Ingrese un numero para la serie Fibonacci (1-10): "
    mensaje_fibonacci: .asciiz "Serie de Fibonacci: "
    salto_linea: .asciiz "\n"

.text
    .globl main
main:
    li $v0, 4
    la $a0, mensaje_pedir
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 1
    li $t3, 0
    li $t4, 0

    li $v0, 4
    la $a0, mensaje_fibonacci
    syscall

fibonacci_loop:
    bge $t4, $t0, fin
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, salto_linea
    syscall

    add $t3, $t1, $t2
    move $t1, $t2
    move $t2, $t3
    addi $t4, $t4, 1
    j fibonacci_loop

fin:
    li $v0, 10
    syscall