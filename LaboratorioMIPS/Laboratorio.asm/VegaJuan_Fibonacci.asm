.data
    mensaje_pedir: .asciiz "Ingrese la cantidad de numeros de Fibonacci a generar (entre 1 y 10): "
    mensaje_error: .asciiz "Error: el numero debe estar entre 1 y 10.\n"
    mensaje_fibonacci: .asciiz "Serie de Fibonacci: "
    salto_linea: .asciiz "\n"

.text
    .globl main
main:
    # Mostrar mensaje inicial
    li $v0, 4
    la $a0, mensaje_pedir
    syscall

    # Leer cantidad de números a generar
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el número ingresado

    # Verificar si está en el rango 1-10
    li $t3, 1
    li $t4, 10
    blt $t0, $t3, error  # Si es menor que 1, mostrar error
    bgt $t0, $t4, error  # Si es mayor que 10, mostrar error

    # Mostrar mensaje de salida
    li $v0, 4
    la $a0, mensaje_fibonacci
    syscall

    # Inicializar valores de Fibonacci
    li $t1, 0  # Primer número de la serie
    li $t2, 1  # Segundo número de la serie
    li $t5, 0  # Contador de términos

fibonacci_loop:
    bge $t5, $t0, fin  # Si ya generamos N términos, salir

    # Imprimir número de la serie
    li $v0, 1
    move $a0, $t1
    syscall

    # Imprimir salto de línea
    li $v0, 4
    la $a0, salto_linea
    syscall

    # Calcular siguiente número de Fibonacci
    add $t3, $t1, $t2
    move $t1, $t2
    move $t2, $t3

    addi $t5, $t5, 1  # Incrementar contador
    j fibonacci_loop

error:
    li $v0, 4
    la $a0, mensaje_error
    syscall
    j main  # Volver a pedir el número

fin:
    # Salir del programa
    li $v0, 10
    syscall