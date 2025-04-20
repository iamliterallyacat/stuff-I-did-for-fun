#include <arpa/inet.h>
#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <netdb.h>
#include <sys/types.h>
#include <stdlib.h>
#include <stdio.h>

int main(){

struct sockaddr_in address;

	address.sin_family = AF_INET;
	address.sin_port   = htons(8090);
	address.sin_addr.s_addr     = INADDR_ANY;	


int sockfd, new_socket;
socklen_t addrlen = sizeof(address);
if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0 ){
	perror("Socket say nuh uh");
	exit(1);
	}

if (bind(sockfd, (struct sockaddr*)&address, sizeof(address)) < 0) {
		perror("Bind say nuh uh");
		exit(2);
		}

if (listen(sockfd, 3) < 0)  {
	perror("Bitch can't listen");
	exit(3);
}

loop:
if ((new_socket = accept(sockfd, (struct sockaddr*)&address, &addrlen)) < 0 ) {
	perror("acceptance issue");
	exit(3);
}

char buffer[1024] = { 0 };
ssize_t valread;
char* response = "HAIII :D";

valread = read(new_socket, buffer, 1024 - 1);

printf("%s\n", buffer);
send(new_socket, response, strlen(response), 0);
close(new_socket);
goto loop;

}
