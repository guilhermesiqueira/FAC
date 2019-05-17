.data
quebraLinha:  .asciiz  "\n"         
msgErro:    .asciiz "entrada incorreta\n"

.text
main:
    #Entradas do usuario
    li $v0, 5         #chamada pra ler um inteiro 
    syscall         #chama o SO
    move $t0, $v0        #move a entrada do teclado para o registrador s0
    
    li $t9, 32768       #carrega o valor 32768 no registrador $s1
    ble $t9, $t0, handleErro #se a entrada do usuário for maior ou igual 32768, a mensagem de erro será printada
    blez $t0, handleErro #se a entrada do usuário for menor ou igual a 0, a mensagem de erro será printada
    add $t3, $t0, 0       #adiciona a t3 o valor armazenado em t0
    

exit:     
    li $v0, 10 #encerra o programa
    syscall #chama o SO

handleErro: 
    la $a0, msgErro #mensagem a ser printada armazenada no registrador a0
    li $v0, 4 #chamada pra ler uma string
    syscall #chama o SO
