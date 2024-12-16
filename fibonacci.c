#include <stdio.h>

int main () {

int fibT = 0;
int fib2 = 1;
int fib1 = 0;

	while (fibCount < 15 ) {
	
	fib1 = fib2 + fib1; //add r8, r9 
	fibT = fib2;	    
	fib2 = fib1;        
        fib1 = fibT;
	fibCount ++;	
	}

printf("%d", fib2);
return 0;
}
