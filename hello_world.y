%{
  #include <stdio.h>
  #include <string.h>
  #include <stdlib.h>
  void yyerror(char *); 
  int yylex(void);

%}

%token ASTERISK COMMA CONST CONST_INTEGER CONST_STRING CHAR EXTERN IDENTIFIER INT LEFT_BRACE LEFT_PARENTHESIS MAIN RETURN RIGHT_BRACE RIGHT_PARENTHESIS SEMICOLON 

%union {
  int number;
  char str[256];
  char id[256];
}

%type<id> IDENTIFIER
%type<str> CONST_STRING
%type<number> CONST_INTEGER

%%
start : func_declares main_func_define

func_declares    : func_declare | func_declare func_declares

func_declare     : EXTERN c_type IDENTIFIER LEFT_PARENTHESIS func_var_declare RIGHT_PARENTHESIS SEMICOLON

c_type           : INT | CHAR | INT ASTERISK | CHAR ASTERISK

func_var_declare : c_type | c_type IDENTIFIER | CONST c_type | CONST c_type IDENTIFIER

main_func_define : INT MAIN LEFT_PARENTHESIS RIGHT_PARENTHESIS LEFT_BRACE statements RIGHT_BRACE

statements       : statement | statement statements

statement        : func_call | return_stat

func_call        : IDENTIFIER LEFT_PARENTHESIS CONST_STRING RIGHT_PARENTHESIS SEMICOLON
                 {
		   if (strcmp("puts", $1)==0) {
		     puts($3);
		   } 
		 }
                 ;

return_stat      : RETURN CONST_INTEGER SEMICOLON
                 {
		   return yylval.number;
		 }
                 ;

%%
int main()
{
  int ret = yyparse();
  return ret;
}
