
#include <stdio.h>
#include <stdint.h>
//#include <stdlib.h>


uint16_t crc16_buypass(unsigned char *data, int len)
{
// c eh o estado
// r eh o valor calculado
// d eh o dado
// s, p e t sao valores intermediarios
 uint8_t  d, s, p;
 int c=0, r=0, t=0;
 int contador;
 int r1=0, r2=0, r3=0, r4=0;

 for(contador=0; contador<len; contador++)
 {
	 d = (uint8_t)*(data+contador);
	 printf("d = %d \n contador = %d\n", d, contador);
	 printf("c (antes) = %d\n",c);
	 s = d ^ (c >> 8);
	 printf("s = %d\n",s);
	 p = s ^ (s >> 4);
	 printf("p1 = %d \n", p);
	 p = p ^ (p >> 2);
	 printf("p2 = %d \n", p);
	 p = p ^ (p >> 1);
	 printf("p3 = %d \n", p);
	 p = p & 1;
	 printf("p4 = %d \n", p);
	 t = p | (s << 1);
	 printf("t = %d \n", t);
	 r1 = (c << 8);
	 printf("c << 8 = %d\n", r1);
	 printf("t de novo = %d\n", t);
	 r2 = (t << 15);
	 printf("t << 15 = %d\n", r2);
	 r3 = r1 ^ r2;
	 printf("t << 15 ^ c << 8 = %d\n", r3);
	 r4 = r3 ^t;
	 printf("r3 = %d\n",r4);
	 r = r4^(t << 1);
	 printf("r = %d \n", r);
	 c=r;
 }
printf("r fora do for = %d\n", r);

 return r;

}


void main(void)
{

 unsigned char my_input[17];
 int my_crc;

 scanf(" %[^\t\n]s", my_input);

 printf("[%s]:%d\n", my_input, strlen(my_input));
	
 my_crc = crc16_buypass(my_input, strlen(my_input));
 printf("my_crc = %d \n", my_crc);
 printf("0x%04X\n", my_crc);

}
