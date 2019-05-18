# include <stdio.h> 
# include <math.h> 
  
// A function to print all prime factors of a given number n 
void primeFactors(int n) 
{ 
    // Print the number of 2s that divide n 
    while (n%2 == 0) 
    { 
        printf("%d \n", 2); 
        n = n/2; 
    } 

    float a = 0.0;
    int b = 0;
    // n must be odd at this point.  So we can skip  
    // one element (Note i = i +2) 
    a = sqrt(n);
        printf("sqrt = %f \n", a);
    for (int i = 3; i <= sqrt(n); i = i+2) 
    { 
        printf("entrou no for \n");
        printf("n = %d \n",n);
        a = sqrt(n);
        printf("i = %d \n", i);
        printf("sqrt = %f \n", a);
        b = n%i;
        printf( "resto de n por i = %d \n", b );
        // While i divides n, print i and divide n 
        while (n%i == 0) 
        { 

            printf("entra no while\n");
            printf("i: %d \n", i);
            printf("n: %d \n", n); 
            printf("dividindo n por i \n");
            n = n/i;
            printf("i depois da divisao: %d \n", i);
            printf("n depois da divisao: %d \n", n); 
            b = n%i;
            printf( "resto de n por i dentro do while = %d \n", b );
        } 
    } 
  
    // This condition is to handle the case when n  
    // is a prime number greater than 2 
    if (n > 2) 
        printf ("%d \n", n); 
} 
  
/* Driver program to test above function */
int main() 
{ 
    int n = 0; 
    printf("Digite um número: ");
    scanf("%d", &n);
    primeFactors(n); 
    printf("\n");
    return 0; 
} 