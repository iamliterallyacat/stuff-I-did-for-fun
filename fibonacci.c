#include <stdio.h>
#include <stdlib.h>

int main (int argc, char* argv[]) 
{
int fibLimit = atoi(argv[1]);
int fibT = 0;
int fib2 = 1;
int fib1 = 0;

	while (1 < fibLimit ) 
	{
	fib1 = fib2 + fib1; //add r8, r9 
	fibT = fib2;	    
	fib2 = fib1;        
        fib1 = fibT;
	fibLimit --;	
	}

printf("%d\n", fib2);
return 0;
}
