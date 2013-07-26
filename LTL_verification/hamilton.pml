/* Copyright 2007 by Moti Ben-Ari under the GNU GPL; see readme.txt */

#define N 20

typedef ROW {
	bool row[N];
}

ROW step[N];
bool used[N];
byte result[N];

inline initV(r, c, v) {
	step[r-1].row[c-1] = v
}

inline addUndirectedEdge(r, c) {
	initV(r, c, true);
	initV(c, r, true);
}

inline initValues() {
	byte k = 1;
	byte j = 1;
	do
	:: k == N+1 -> break
	:: else ->
		j = 1;
		do
		:: j == N+1 -> break
		:: else ->
			initV(k, j, false);
			j++
		od;
		k++
	od;

	addUndirectedEdge(1, 20);
	addUndirectedEdge(1, 17);
	addUndirectedEdge(1, 2);
	addUndirectedEdge(2, 3);
	addUndirectedEdge(2, 15);
	addUndirectedEdge(3, 4);
	addUndirectedEdge(3, 13);
	addUndirectedEdge(4, 5);
	addUndirectedEdge(4, 20);
	addUndirectedEdge(5, 6);
	addUndirectedEdge(5, 12);
	addUndirectedEdge(6, 7);
	addUndirectedEdge(6, 19);
	addUndirectedEdge(7, 8);
	addUndirectedEdge(7, 11);
	addUndirectedEdge(8, 9);
	addUndirectedEdge(8, 18);
	addUndirectedEdge(9, 10);
	addUndirectedEdge(9, 16);
	addUndirectedEdge(10, 11);
	addUndirectedEdge(10, 14);
	addUndirectedEdge(11, 12);
	addUndirectedEdge(12, 13);
	addUndirectedEdge(13, 14);
	addUndirectedEdge(14, 15);
	addUndirectedEdge(15, 16);
	addUndirectedEdge(16, 17);
	addUndirectedEdge(17, 18);
	addUndirectedEdge(18, 19);
	addUndirectedEdge(19, 20);
}

inline Choose(choice) {
	if
	:: choice = 1
	:: choice = 2
	:: choice = 3
	:: choice = 4
	:: choice = 5
	:: choice = 6
	:: choice = 7
	:: choice = 8
	:: choice = 9
	:: choice = 10
	:: choice = 11
	:: choice = 12
	:: choice = 13
	:: choice = 14
	:: choice = 15
	:: choice = 16
	:: choice = 17
	:: choice = 18
	:: choice = 19
	:: choice = 20
	fi
}

inline Write() {
	byte k = 0;
	do
	:: k == N || result[k] == 0 -> break
	:: else ->
		printf("%d ", result[k]);
		k++
	od;
	printf("\n")
}

active proctype Cycles() {
	byte initial, old, new, i;
	initValues();
	Choose(initial);
	printf ("init choose: %d\n", initial);
	old = initial;
	do
	::	result[i] = old;
		i++;
		Choose(new);

		// isHamiltonCycle?
		if
		:: i == N && new == initial -> break 
		:: else -> true
		fi;

		!used[new-1];
		step[old-1].row[new-1];

		// i 가 N 보다 작을 때는 initial 을 선택하면 안됨. 
		if
		:: new == initial && i < N ->
			false;
		:: else -> 
			used[new-1] = true;
			old = new
		fi
	od;
	Write();
	assert(false)
}
