.data
    mensaje_pedir: .asciiz "Ingrese la cantidad de numeros a comparar (3-5): "
    mensaje_numero: .asciiz "Ingrese un numero: "
    mensaje_mayor: .asciiz "El numero mayor es: "

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
    li $t2, -2147483648

loop:
    bge $t1, $t0, fin
    li $v0, 4
    la $a0, mensaje_numero
    syscall

    li $v0, 5
    syscall
    blt $t2, $v0, actualizar_mayor
    j continuar

actualizar_mayor:
    move $t2, $v0

continuar:
    addi $t1, $t1, 1
    j loop

fin:
    li $v0, 4
    la $a0, mensaje_mayor
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 10
    syscall