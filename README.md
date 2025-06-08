# AV3 Compilador

Este projeto implementa um analisador léxico (Scanner) usando JFlex e um analisador sintático (Parser) usando CUP, integrados em uma aplicação Java.

## Pré-requisitos

- Java JDK 8 ou superior
- [JFlex](https://jflex.de/)
- [CUP](http://www2.cs.tum.edu/projects/cup/)


## Estrutura do Projeto

- `src/Scanner.flex` — Definição do analisador léxico (JFlex)
- `src/Parser.cup` — Definição do analisador sintático (CUP)
- `src/Main.java` — Classe principal para execução
- `input.txt` — Arquivo de entrada com o código a ser analisado

## Compilando o Projeto

1. Gere o scanner com JFlex:
   ```sh
   java -jar lib/jflex-full-1.9.1.jar src/scanner.flex

1.1. adicione o comando import java_cup.runtime.Symbol; 
   no início do arquivo `src/Scanner.java` gerado pelo JFlex.
   
2. Gere o parser com CUP:
   ```sh
    java -jar lib/java-cup-11b.jar -parser Parser -symbols sym -destdir src src/parser.cup
3. Compile o código Java:
 
## Execute o programa:
   - Coloque o código a ser analisado em  input.txt na raiz do projeto.
   - Execute a aplicação