//(a+bb*ab*)*
#include<stdio.h>
#include<string.h>
#include<stdbool.h>
enum state{q0, q1, q2, q3, qd};
enum state A(char ch) {
	if(ch=='a')
		return q1;
	if(ch=='b')
		return q0;
	else
		return qd;
}
enum state B(char ch) {
	if(ch=='a')
		return q2;
	if(ch=='b')
		return q0;
	else
		return qd;
}
enum state C(char ch) {
	if(ch=='a')
		return q1;
	if(ch=='b')
		return q3;
	else
		return qd;
}
enum state D(char ch) {
	if(ch=='a')
		return q2;
	if(ch=='b')
		return q3;
	else
		return qd;
}
bool isAccepted(char* str) {
	int n=strlen(str);
	printf("%d",n);
	enum state dfa=q1;
	for(int i=0;i<n;i++) {
		if(dfa==q1)
			dfa=A(str[i]);
		else if(dfa==q0)
			dfa=B(str[i]);
		else if(dfa==q2)
			dfa=C(str[i]);
		else if(dfa==q3)
			dfa=D(str[i]);
		else
			break;
	}
	if(dfa!=q0&&dfa!=qd)
		return true;
	else
		return false;
}
int main(void) {
	char str[100];
	scanf("%s",str);
	if(isAccepted(str))
		printf("\n%s Accepted\n",str);
	else
		printf("\nNOT Accepted\n");
	return 0;
}
