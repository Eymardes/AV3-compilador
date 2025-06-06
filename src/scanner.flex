%%

%class Scanner
%unicode
%cup
%line
%column

%{

%}

%%

/* Palavras-chave */
"if"            { return new Symbol(sym.IF); }
"else"          { return new Symbol(sym.ELSE); }
"while"         { return new Symbol(sym.WHILE); }
"return"        { return new Symbol(sym.RETURN); }

/* Operadores */
"=="            { return new Symbol(sym.IGUAL); }
"!="            { return new Symbol(sym.DIFERENTE); }
">"             { return new Symbol(sym.MAIOR); }
"<"             { return new Symbol(sym.MENOR); }
">="            { return new Symbol(sym.MAIOR_IGUAL); }
"<="            { return new Symbol(sym.MENOR_IGUAL); }
"="             { return new Symbol(sym.ATRIBUI); }
"+"             { return new Symbol(sym.MAIS); }
"-"             { return new Symbol(sym.MENOS); }
"*"             { return new Symbol(sym.MULT); }
"/"             { return new Symbol(sym.DIV); }

/* Delimitadores */
";"             { return new Symbol(sym.PV); }
"("             { return new Symbol(sym.AP); }
")"             { return new Symbol(sym.FP); }
"{"             { return new Symbol(sym.AC); }
"}"             { return new Symbol(sym.FC); }

/* Comentários */
"//".*                      { /* Comentário de linha - ignora */ }
"/*"([^*] | \*+[^*/])*\*+"/" { /* Comentário de bloco - ignora */ }

/* Constantes numéricas */
[0-9]+                      { return new Symbol(sym.NUM_INT, yytext()); }
[0-9]+"."[0-9]+             { return new Symbol(sym.NUM_FLOAT, yytext()); }

/* Identificadores */
[A-Za-z_][A-Za-z0-9_]*      { return new Symbol(sym.ID, yytext()); }

/* Espaços em branco e quebras de linha */
[\ \t\r\n]+                 { /* Ignora espaços, tabulações e novas linhas */ }

/* Caracteres inválidos */
.                           { System.out.println("Caractere inválido: " + yytext()); }
