#include<stdio.h>
#include<string.h>
#include<stdbool.h>
enum{qd=-1,q0,qf};
void A(char ch, int *state) {
	if(ch=='0')
		*state=qf;
	else if(ch!='1')
		*state=qd;
}
void B(char ch, int *state) {
	if(ch=='1')
		*state=q0;
	else if(ch!='0')
		*state=qd;
}
bool isAccepted(char* str,int *state) {
	int len=strlen(str);
	for(int i=0;i<len;i++) {
		if(*state==q0)
			A(str[i],state);
		else if(*state==qf)
			B(str[i],state);
		else
			return false;
	}
	return (*state==qf);
}
int main(void) {
	int t, state;
	scanf("%d",&t);
	if(t<0)
		t*=-1;
	char str[100];
	while(t--) {
		printf("\n");
		scanf("%s",str);
		state=q0;
		if(isAccepted(str,&state))
			printf("\nString Accepted %s\n",str);
		else
			printf("\nNOT Accepted\n");
	}
	return 0;
}
