
main:
#  la $a0,str1 #carrega string str1
#  li $v0,4 #chamada para printar
#  syscall #chama o SO

  li $v0,8 #pega a entrada do usuário
  la $a0, buffer #carrega o espaço dos bytes no registrador a0
  li $a1, 16 #aloca o espaço de bytes para a string
  move $t0,$a0 #move a entrada do usuário para o registrador t0
  syscall #chama o SO
  li $t1, 0 # carrega o 0 no registrador t1 (contador do for)
  addi	$t2, $0, '\n'
  jal for
  #jal printaResultado #chama função de printar resultado
  
# $t3 = d
# $t4 = s
# $t5 = p
# $t6 = t
# $t7 = r
# $t8 = c // pode virar $v0

for:
  lb $t3, ($a0)
  beq $t3, $t2, decToHex  
  and $t3, $t3, 0xFF
  srl $v1,$t8,8 #(c >> 8)
  xor $t4,$t3,$v1 #s = d xor (c >> 8)

  srl $v1,$t4,4 #(s >> 4)
  xor $t5,$t4,$v1 #p = s xor (s >> 4)


  srl $v1,$t5,2 #(p > 2)
  xor $t5,$t5,$v1 #p = p xor (p >> 2)

  srl $v1,$t5,1 #(p >> 1)
  xor $t5,$t5,$v1 #p = p xor (p >> 1)
  
  and $t5, $t5, 1 #p = p and 1

  sll $v1, $t4, 1 #(s << 1)
  or  $t6, $t5, $v1 #t = p | (s << 1)

  sll $v0, $t8, 8 #(c << 8)
  and $a3, $t6, 0xFFFF # get just the high 16 bits
  sll $a3, $a3, 15 #(t << 15)
  sll $a2, $t6, 1 #(t << 1)
  xor $a1, $v0, $a3 #(c << 8)^(t << 15)
  xor $a1, $a1, $t6 #(c << 8)^(t << 15)^t
  xor $t7, $a1, $a2 #r = (c << 8)^(t << 15)^t^(t << 1)
  add $t8, $t7, 0
  and $t8, $t8, 0xFFFF  
  addi $t1, $t1, 1 #i = i + 1
  addi $a0, $a0, 1 # go to next byte      

  j for

decToHex:
  li $t0, 0
  li $t3, 0
  li $t4, 0
  li $t2, 0
  li $t0, 8 #contador
  la $t3, result #onde a resposta vai ser guardada
  jal loopHex

loopHex:
  beqz $t0, exit
  rol $t8, $t8, 4 #rotaciona 4 bits para a esquerda
  and $t4, $t8, 0xf #mascára com 1111
  ble $t4, 9, Soma #se for menor ou igual a 9, muda pra soma
  addi $t4, $t4, 55 #se for maior que 9, soma 55
  b Fim

Soma:
  addi $t4, $t4, 48 #soma 48 ao resultado

Fim:
  sb $t4, 0($t3) #guarda o digito do hexadecimal no resultado
  addi $t3, $t3, 1 #incrementa o contador de endereço
  addi $t0, $t0, -1 #decrementa o contador do loop
  j loopHex

# printaResultado:
#   la $a0,str2 #carrega a string str2
#   li $v0,4 #chamada para printar string
#   syscall #chama o SO

#   #la $a0, buffer #recarrega o esoaço de bytes para o endereço primário
# #  move $a0,$t8 #primary address = t0 
#   li $v0,34 #printa a string
#   syscall #chama o SO
#   jal exit #chama função de sair
  
exit:
  la $a0, result
  li $v0, 4
  syscall
  li $v0,10 #Termina o programa
  syscall #chama o SO

.data
  buffer: .space 16
  str1:  .asciiz "Digite uma string:"
  str2:  .asciiz "CRC16­BUYPASS: "
  result: .space 8

