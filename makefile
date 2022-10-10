default:
	bison -d calc.y
	flex -l calc.l
	gcc -o calc  calc.tab.c lex.yy.c  -ll
clean:
	rm -f calc calc.tab.c lex.yy.c calc.tab.h