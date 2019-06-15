
main:
  la $a0,str1 #carrega string str1
  li $v0,4 #chamada para printar
  syscall #chama o SO

  li $v0,8 #pega a entrada do usuário
  la $a0, buffer #carrega o espaço dos bytes no registrador a0
  li $a1, 16 #aloca o espaço de bytes para a string
  move $t0,$a0 #move a entrada do usuário para o registrador t0
  syscall #chama o SO

  li $t1, 0 # carrega o 0 no registrador t1 (contador do for)
  li $t2, 1 # carrega o 1 no registrador t2 (pra incrementar)
  jal for
  jal printaResultado #chama função de printar resultado
  
# $t3 = d
# $t4 = s
# $t5 = p
# $t6 = t
# $t7 = r
# $t8 = c // pode virar $v0

for:
  lbu $t3, 0($a0)
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
  sll $a3, $t6, 15 #(t << 15)
  sll $a2, $t6, 1 #(t << 1)
  xor $a1, $v0, $a3 #(c << 8)^(t << 15)
  xor $a1, $a1, $t6 #(c << 8)^(t << 15)^t
  xor $t7, $a1, $a2 #r = (c << 8)^(t << 15)^t^(t << 1)
  add $t8, $t7, 0
  
  add $t1, $t1, $t2 #i = i + 1

  j for

printaResultado:
  la $a0,str2 #carrega a string str2
  li $v0,4 #chamada para printar string
  syscall #chama o SO

  la $a0, buffer #recarrega o esoaço de bytes para o endereço primário
  move $a0,$t0 #primary address = t0 
  li $v0,4 #printa a string
  syscall #chama o SO
  jal exit #chama função de sair


exit:
  li $v0,10 #Termina o programa
  syscall #chama o SO

.data
  buffer: .space 16
  str1:  .asciiz "Digite uma string: "
  str2:  .asciiz "Você escreveu:\n"
