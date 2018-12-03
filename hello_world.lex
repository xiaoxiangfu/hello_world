/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>

  /* yytext is a string containing the matched text. */
  void output_reserved_word()
  {
    printf("Saw reserved word(%s)\n", yytext);
  }

  void output_identifier()
  {
    printf("Saw identifier(%s)\n", yytext);
  }

  void output_operator()
  {
    printf("Saw operator(%s)\n", yytext);
  }

  void output_special_symbol()
  {
    printf("Saw special symbol(%s)\n", yytext);
  }

  void output_const()
  {
    printf("Saw const(%s)\n", yytext);
  }

%}

/* This tells flex to read only one input file */
%option noyywrap

%%

 /*** Rules section ***/

 /*** reserved word ***/
const|char|extern|int|return  {
  output_reserved_word();
}

 /*** identifier ***/
[_a-zA-Z][a-zA-Z_0-9]* {
  output_identifier();
}

 /*** operator ***/
\(|\)|\* {
  output_operator();
}

 /*** special symbol ***/
\{|\}|; {
  output_special_symbol();
}

 /*** const ***/
 /*** integer const ***/
[0-9]+  {

  output_const();
}

 /*** string const ***/
\".*\" {
  output_const();
}

 /*** others ***/
.|\n    {   /* Ignore all other characters. */   }

%%
 /*** C Code section ***/

int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}
