.data
soma: .asciiz "ADD: "
subtracao: .asciiz "\nSUB: "
e: .asciiz "\nAND: "
ou: .asciiz "\nOR: "
exor: .asciiz "\nXOR: "
sll1: .asciiz "\nSLL(3): "
srl1: .asciiz "\nSRL(1): "
new_line:	.asciiz  "\n"         

.text
main:
    li $v0, 5 #chamada pra ler um inteiro 
    syscall #chama o SO
    move $s0, $v0  #move a entrada do teclado para o registrador s0

    li $v0, 5 #chamada pra ler um inteiro         
    syscall #chama o SO
    move $s1, $v0 #move a entrada do teclado para o registrador s1
    
    #printa a string SOMA
    la $a0, soma #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO

    add $t0, $s0, $s1 #calcula a soma
    move $a0, $t0 #move t0 para o registrador a0
    li $v0, 1 #printa o inteiro na tela
    syscall #chama o SO

    #printa a string de resultado
    la $a0, subtracao #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO

    sub $t1, $s0, $s1 #subtracao
    move $a0, $t1 #move t1 para o registrador a0
    li $v0, 1 #printa o inteiro na tela
    syscall #chama o SO
    
    #printa a string AND
    la $a0, e #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
    and $t2, $s0, $s1 #faz a and    
    move $a0, $t2 #move t2 para o registrador a0	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
    
    #printa a string OR
    la $a0, ou #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
    or $t3, $s0, $s1 #faz a or
    move $a0, $t3 #move t3 para o registrador a0	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
        
    #printa a string XOR
    la $a0, exor #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
    xor $t4, $s0, $s1 #faz a xor
    move $a0, $t4 #move t4 para o registrador a0	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
    
    #printa a string SLL
    la $a0, sll1 #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
    sll $t5, $s0, 3 #faz o sll
    move $a0, $t5 #move t5 para o registrador a0	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO
    
    #printa a string SRL
    la $a0, srl1 #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
    srl $t6, $s1, 1 #faz o srl
    move $a0, $t6 #move t6 para o registrador a0	
    li $v0, 1 #printa o inteiro no registrador 0
    syscall #chama o SO

    la   $a0, new_line   	#mensagem a ser printada armazenada no registrador a0
    li   $v0, 4           	#chamada pra ler uma string
    syscall               	#chama o SO

    li $v0, 10 #encerra o programa
    syscall #chama o SO
