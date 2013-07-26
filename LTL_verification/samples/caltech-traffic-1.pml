bit g1=0, g2=0
active proctype P()
{
	do
	:: atomic { (g1 == 0 && g2 == 0) -> g1 = 1; g2 = 0 }
	:: atomic { (g1 == 0 && g2 == 0) -> g1 = 0; g2 = 1 }
	:: atomic { (g1 == 1 && g2 == 0) -> g1 = 0; g2 = 0 }
	:: atomic { (g1 == 0 && g2 == 1) -> g1 = 0; g2 = 0 }
	od
}

never {
T0_init:
	if
	:: ((g1 && g2)) -> goto accept_all
	:: (1) -> goto T0_init
	fi;
accept_all:
	skip
}
