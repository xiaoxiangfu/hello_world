bison -d -v hello_world.y
flex hello_world_v2.lex
gcc -c lex.yy.c
gcc -c hello_world.tab.c
gcc -o hello_world_ly hello_world.tab.o lex.yy.o -ly
