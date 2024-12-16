#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
int main (int argc, char* argv[]) 
{
int fibLimit = atoi(argv[1]);
uint64_t fibT = 0;
uint64_t  fib2 = 1;
uint64_t fib1 = 0;

	while (1 < fibLimit ) 
	{
	fib1 = fib2 + fib1; //add r8, r9 
	fibT = fib2;	    
	fib2 = fib1;        
        fib1 = fibT;
	fibLimit --;	
	}
	
	

printf("%llu\n", fib2);
return 0;
}
