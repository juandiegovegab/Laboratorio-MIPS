    .data
mensaje: .asciiz "Hola, mundo\n"

    .text
    .globl main
main:
    li $v0, 4         # Código de sistema para imprimir string
    la $a0, mensaje   # Cargar la dirección del mensaje en $a0
    syscall           # Llamar al sistema para imprimir

    li $v0, 10        # Código de sistema para salir del programa
    syscall           # Llamar al sistema para terminar