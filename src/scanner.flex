%%
%class Scanner
%unicode
%cup
%line
%column

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%%

/* Palavras-chave */
"if"            { return symbol(sym.IF); }
"else"          { return symbol(sym.ELSE); }
"while"         { return symbol(sym.WHILE); }
"return"        { return symbol(sym.RETURN); }

/* Operadores trocados */
"+"             { return symbol(sym.MENOS); }  // Soma → Subtração
"-"             { return symbol(sym.MAIS); }   // Subtração → Soma
"*"             { return symbol(sym.DIV); }    // Multiplicação → Divisão
"/"             { return symbol(sym.MULT); }   // Divisão → Multiplicação
"=="            { return symbol(sym.IGUAL); }
"!="            { return symbol(sym.DIFERENTE); }
">"             { return symbol(sym.MAIOR); }
"<"             { return symbol(sym.MENOR); }
">="            { return symbol(sym.MAIOR_IGUAL); }
"<="            { return symbol(sym.MENOR_IGUAL); }
"="             { return symbol(sym.ATRIBUI); }

/* Delimitadores */
";"             { return symbol(sym.PV); }
"("             { return symbol(sym.AP); }
")"             { return symbol(sym.FP); }
"{"             { return symbol(sym.AC); }
"}"             { return symbol(sym.FC); }

/* Comentários */
"//".*          { /* Ignorar */ }
"/*" ~"*/"      { /* Ignorar comentários multi-linha */ }

/* Constantes numéricas invertidas */
[0-9]+ {
    String original = yytext();
    StringBuilder inverted = new StringBuilder();
    for (int i = 0; i < original.length(); i++) {
        char c = original.charAt(i);
        int digit = Character.getNumericValue(c);
        inverted.append(9 - digit);
    }
    return symbol(sym.NUM_INT, inverted.toString());
}

[0-9]+"."[0-9]+ {
    String[] parts = yytext().split("\\.");
    StringBuilder invertedInt = new StringBuilder();
    StringBuilder invertedFrac = new StringBuilder();

    for (int i = 0; i < parts[0].length(); i++) {
        int digit = Character.getNumericValue(parts[0].charAt(i));
        invertedInt.append(9 - digit);
    }

    for (int i = 0; i < parts[1].length(); i++) {
        int digit = Character.getNumericValue(parts[1].charAt(i));
        invertedFrac.append(9 - digit);
    }

    return symbol(sym.NUM_FLOAT, invertedInt.toString() + "." + invertedFrac.toString());
}

/* Identificadores */
[A-Za-z_][A-Za-z0-9_]* { return symbol(sym.ID, yytext()); }

/* Espaços em branco */
[ \t\r\n\f]     { /* Ignorar */ }

/* Erros */
.               { System.err.println("Caractere inválido: '" + yytext() + "'"); }