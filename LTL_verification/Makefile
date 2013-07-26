SPIN := ../tools/spin.exe

SRC := hamilton.pml

solution1: hamilton
	$(abspath $<) -E
	-$(SPIN) -k $(SRC).trail $(SRC) | grep "result" || exit 0 # ignore exit status 

solution%: $(SRC)%.trail
	-$(SPIN) -k $< $(SRC) | grep "result" || exit 0 # ignore exit status


solutionAll: hamilton
	$(abspath $<) -E -c0 -ehamilton: hamilton.c

hamilton: hamilton.c
	gcc -o $@ $<

hamilton.c: $(SRC)
	$(SPIN) -a $<  # pan.c file is generated.
	mv pan.c $@

clean:
	-rm -rf *trail hamilton hamilton.c pan.*
