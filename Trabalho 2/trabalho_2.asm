.data
quebraLinha:  .asciiz  "\n"         
msgErro:    .asciiz "entrada incorreta\n"
msgSaida:    .asciiz "saida: "
msgBitParidade:   .asciiz "bit-paridade: "

.text
main:
    #Entradas do usuario
    li $v0, 5         #chamada pra ler um inteiro 
    syscall         #chama o SO
    move $t0, $v0        #move a entrada do teclado para o registrador s0
    
    li $t9, 128       #carrega o valor 128 no registrador $s1
    ble $t9, $t0, handleErro
    add $t3, $t0, 0       #adiciona a t3 o valor armazenado em t0
    jal loop         #chama o procedimento loop
    
loop:
  beqz $t0, fimLoop    #condicao de parada do laco 
  rem $t2, $t0, 2         #salva o resto da divisão do valor de t0 por 2 em t2
  jal verificaParidadeLoop   #verifica se é par ou ímpar
  
verificaParidadeLoop:
  bgtz $t2, incrementaUm #se for impar, add 1
  jal deslocaUm    #desloca o bit 
  
incrementaUm:
  add $t1, $t1, 1     #contador de 1
  jal deslocaUm       #desloca o bit

deslocaUm:  
  srl $t0, $t0, 1   #desloca os bits uma casa a direita
  jal loop      #recursao para execucao do loop
    
fimLoop:
  rem $t1, $t1, 2     #salva o resto da divisao do valor de t1 por 2
  jal verificaParidadeResto

verificaParidadeResto:
  bgtz $t1, resultadoImpar    #caso resto da divisao do valor de t1 por 2 seja maior que 0, vai para resultadoImpar
  jal resultadoPar      #chama resultadoPar

resultadoImpar:
  li $t4, 1      #atribui 1 ao registrador t4, que é o bit de paridade
  add $t3, $t3, 128    #soma 128
  jal printaResultado  #chama printaResultado

resultadoPar:
  li $t4, 0      #atribui 0 ao registrador $t4
  jal printaResultado #chama printaResultado
  
printaResultado:
  la $a0, msgBitParidade   #mensagem a ser printada armazenada no registrador a0
  li $v0, 4      #chamada pra printar uma string
  syscall        #chama o S0
  
  move $a0, $t4  #move valor de t4 para a0 para ser printado
  li $v0, 1      #chamada pra printar um inteiro
  syscall        #chama o S0
  
  la $a0, quebraLinha    #mensagem a ser printada armazenada no registrador a0 (quebra de linha)
  li $v0, 4      #chamada pra printar uma string
  syscall        #chama o S0
  
  la $a0, msgSaida  #mensagem a ser printada armazenada no registrador a0 
  li $v0, 4      #chamada pra printar uma string
  syscall        #chama o S0
  
  move $a0, $t3  #move valor de t3 para a0 para ser printado    
  li $v0, 1      #chamada pra printar um inteiro
  syscall        #chama o S0
  
  la $a0, quebraLinha #mensagem a ser printada armazenada no registrador a0 (quebra de linha)
  li $v0, 4      #chamada pra printar uma string
  syscall        #chama o S0

  jal exit        #encerra o programa

exit:     
    li $v0, 10 #encerra o programa
    syscall #chama o SO

handleErro: 
    la $a0, msgErro #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
