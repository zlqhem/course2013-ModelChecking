// 프로세스 간의 간섭을 소개 
byte n = 0;
active proctype P() {
	byte temp;
	temp = n + 1;
	n = temp;
	printf ("Process P, n = %d\n", n);
}

active proctype Q() {
	byte temp;
	temp = n + 1;
	n = temp;
	printf ("Process Q, n = %d\n", n);
}
