.data
soma: .asciiz "ADD:"
subtracao: .asciiz "\nSUB:"

.text
main:
    li $v0, 5 #chamada pra ler um inteiro 
    syscall #chama o SO
    move $s0, $v0  #move a entrada do teclado para o registrador s0

    li $v0,5 #chamada pra ler um inteiro         
    syscall #chama o SO
    move $s1,$v0 #move a entrada do teclado para o registrador s1

    #printa a string de resultado
    li $v0, 4 #chamada pra ler uma string
    la $a0, soma #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO

    add $a0, $s0, $s1 #calcula a soma
    li $v0, 1 #printa o inteiro na tela
    syscall #chama o SO

    #printa a string de resultado
    li $v0, 4 #chamada pra ler uma string
    la $a0, subtracao #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO

    sub $a0, $s0, $s1 #subtração
    li $v0, 1 #printa o inteiro na tela
    syscall #chama o SO
    	
    li $v0, 10 #encerra o programa
    syscall #chama o SO