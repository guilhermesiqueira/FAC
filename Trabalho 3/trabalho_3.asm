.data
quebraLinha:  .asciiz  "\n"         
msgErro:    .asciiz "entrada incorreta\n"

.text
main:
    #Entradas do usuario
    li $v0, 5         #chamada pra ler um inteiro 
    syscall         #chama o SO
    move $t0, $v0        #move a entrada do teclado para o registrador t0
    
    li $t9, 32768       #carrega o valor 32768 no registrador $s1
    ble $t9, $t0, handleErro #se a entrada do usuário for maior ou igual 32768, a mensagem de erro será printada
    blez $t0, handleErro #se a entrada do usuário for menor ou igual a 0, a mensagem de erro será printada
    li $t1, 2 # dividir por 2
    li $t5, 3 # i do for
    jal while
    
while:
    li $t2, 0
    div $t0, $t1 #divide a entrada do usuário por 2
    mfhi $t2 #pega o resto da divisão
    bnez $t2, lacoFor 
    mflo $t0
    move $a0, $t1  #move valor de t1 para a0 para ser printado
    li $v0, 1      #chamada pra printar um inteiro
    syscall        #chama o S0
    la $a0, quebraLinha    #mensagem a ser printada armazenada no registrador a0 (quebra de linha)
    li $v0, 4      #chamada pra printar uma string
    syscall        #chama o S0
    j while
    
lacoFor:
	#sqrt.s $t4, $t0 #salva raíz de n e salva em t4
	mtc1 $t0, $f0 #salvando em ponto flutuante o valor de entrada do usuário
	cvt.s.w $f0, $f0
	sqrt.s $f2, $f0 #salva raíz de n e salva em t4
	
	mfc1 $t7, $f2
	
	ble $t5, $t7,vaiProIf #se a raíz for menor ou igual a i (contador), sai do loop
	
	add $t5, $t5, $t1 #i = i + 2
	jal exit


whileDoFor:
    li $t2, 0
    div $t0, $t5 #divide a entrada do usuário por i
    mfhi $t2 #pega o resto da divisão
    bnez $t2, lacoFor 
    mflo $t0 #pega o quociente
    move $a0, $t5  #move valor de t1 para a0 para ser printado
    li $v0, 1      #chamada pra printar um inteiro
    syscall        #chama o S0
    la $a0, quebraLinha    #mensagem a ser printada armazenada no registrador a0 (quebra de linha)
    li $v0, 4      #chamada pra printar uma string
    syscall        #chama o S0
    j whileDoFor

vaiProIf:
    bgt $t0, 2, printaResultado

exit:     
    li $v0, 10 #encerra o programa
    syscall #chama o SO

handleErro: 
    la $a0, msgErro #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
    
printaResultado:  
  move $a0, $t0  #move valor de t4 para a0 para ser printado
  li $v0, 1      #chamada pra printar um inteiro
  syscall        #chama o S0
  
  la $a0, quebraLinha    #mensagem a ser printada armazenada no registrador a0 (quebra de linha)
  li $v0, 4      #chamada pra printar uma string
  syscall        #chama o S0
  
  
  
