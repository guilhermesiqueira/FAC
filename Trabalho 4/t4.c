
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
 uint16_t c=0, r=0, t=0;
 int contador;


 for(contador=0; contador<len; contador++)
 {
	 d = (uint8_t)*(data+contador);
	 printf("d = %d \n contador = %d\n", d, contador);
	 printf("c (antes) = %d\n",c);
	 s = d ^ (c >> 8);
	 printf("c (depois) = %d\n",c);
	 printf("s = %d\n",s);
	 p = s ^ (s >> 4);
	 p = p ^ (p >> 2);
	 p = p ^ (p >> 1);
	 p = p & 1;
	 t = p | (s << 1);
	 r = (c << 8)^(t << 15)^t^(t << 1);
	 c=r;
 }


 return r;

}


void main(void)
{

 unsigned char my_input[17];
 int my_crc;

 scanf(" %[^\t\n]s", my_input);

 printf("[%s]:%d\n", my_input, strlen(my_input));
	
 my_crc = 0x00FFFF&crc16_buypass(my_input, strlen(my_input));

 printf("0x%04X\n", my_crc);

}