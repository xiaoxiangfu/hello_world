/*** Definition section ***/

%{
  /* C code to be copied verbatim */
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  #include "hello_world.tab.h"
%}

/* This tells flex to read only one input file */
%option noyywrap

%%

 /*** Rules section ***/

 /*** reserved word ***/
"const"       { return CONST;  }
"char"        { return CHAR;   }
"extern"      { return EXTERN; }
"int"         { return INT;    }
"return"      { return RETURN; }
"main"        { return MAIN;   }

 /*** identifier ***/
[_a-zA-Z][a-zA-Z_0-9]* {
  strncpy(yylval.id, yytext, 255);
  return IDENTIFIER;
}

 /*** operator & special symbol ***/
"("           { return LEFT_PARENTHESIS; }
")"           { return RIGHT_PARENTHESIS; }
"*"           { return ASTERISK; }
"{"           { return LEFT_BRACE; }
"}"           { return RIGHT_BRACE; }
";"           { return SEMICOLON; }
","           { return COMMA; }
 /*** const ***/
 /*** integer const ***/
[0-9]+        { yylval.number = atoi(yytext); return CONST_INTEGER; }

 /*** string const ***/
\".*\"        { strncpy(yylval.str, yytext, 255); ;return CONST_STRING; }

 /*** others ***/
.|\n    {   /* Ignore all other characters. */   }

%%
