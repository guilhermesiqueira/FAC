.data
soma: .asciiz "ADD: "
subtracao: .asciiz "\nSUB: "
e: .asciiz "\nAND: "
ou: .asciiz "\nOR: "
exor: .asciiz "\nXOR: "
sll1: .asciiz "\nSLL: "
srl1: .asciiz "\nSRL: "

.text
main:
    li $v0, 5 #chamada pra ler um inteiro 
    syscall #chama o SO
    move $s0, $v0  #move a entrada do teclado para o registrador s0

    li $v0,5 #chamada pra ler um inteiro         
    syscall #chama o SO
    move $s1,$v0 #move a entrada do teclado para o registrador s1

    #printa a string SOMA
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

    #printa a string AND
    li $v0, 4 #chamada pra ler uma string
    la $a0, e #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO
    
    and $a0, $s0, $s1 #faz a and    	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
    
    #printa a string OR
    li $v0, 4 #chamada pra ler uma string
    la $a0, ou #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO
    
    or $a0, $s0, $s1 #faz a or
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
    
    #printa a string XOR
    li $v0, 4 #chamada pra ler uma string
    la $a0, exor #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO
    
    xor $a0, $s0, $s1 #faz a xor
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO

    #printa a string SLL
    li $v0, 4 #chamada pra ler uma string
    la $a0, sll1 #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO
    
    sll $a0, $s0, 3 #faz o sll
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO

    #printa a string SRL
    li $v0, 4 #chamada pra ler uma string
    la $a0, srl1 #mensagem a ser printada armazenada no registrador a0
    syscall #chama o SO
    
    srl $a0, $s1, 1 #faz o srl
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
                                                
    li $v0, 10 #encerra o programa
    syscall #chama o SO
