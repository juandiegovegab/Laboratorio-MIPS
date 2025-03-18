.data
    mensaje_pedir: .asciiz " ingresar 4 numeros entre 1 y 10.\n"
    mensaje_numero: .asciiz "Ingrese un numero: "
    mensaje_error: .asciiz "Error: el numero debe estar entre 1 y 10.\n"
    mensaje_menor: .asciiz "El numero menor es: "

.text
    .globl main
main:
    # Mostrar mensaje inicial
    li $v0, 4
    la $a0, mensaje_pedir
    syscall

    # Inicializar variables
    li $t1, 0  # Contador de números ingresados
    li $t2, 2147483647  # Inicializar el menor con un valor muy alto

loop:
    bge $t1, 4, fin  # Si ya ingresamos 4 números, terminar

    # Pedir número
    li $v0, 4
    la $a0, mensaje_numero
    syscall

    li $v0, 5  # Leer número
    syscall
    move $t0, $v0  # Guardar el número ingresado

    # Verificar si está en el rango 1-10
    li $t3, 1
    li $t4, 10
    blt $t0, $t3, error  # Si es menor que 1, mostrar error
    bgt $t0, $t4, error  # Si es mayor que 10, mostrar error

    # Comparar con el número menor actual
    bgt $t2, $t0, actualizar_menor

continuar:
    addi $t1, $t1, 1  # Incrementar el contador
    j loop

actualizar_menor:
    move $t2, $t0  # Actualizar el número menor
    j continuar

error:
    li $v0, 4
    la $a0, mensaje_error
    syscall
    j loop  # Volver a pedir el número

fin:
    # Mostrar el número menor
    li $v0, 4
    la $a0, mensaje_menor
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Salir del programa
    li $v0, 10
    syscall