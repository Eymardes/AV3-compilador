import java.io.FileReader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // 1. Inicializa o Scanner (JFlex) com o arquivo de entrada
            Scanner scanner = new Scanner(new FileReader("input.txt"));

            // 2. Inicializa o Parser (CUP) com o Scanner
            Parser parser = new Parser(scanner);

            // 3. (Opcional) Mostrar os tokens gerados pelo Scanner
            System.out.println("=== TOKENS GERADOS PELO SCANNER ===");
            Symbol token;
            while ((token = scanner.next_token()).sym != sym.EOF) {
                System.out.printf("Token: %s (Linha: %d, Coluna: %d)\n",
                        sym.terminalNames[token.sym], token.left, token.right);
            }

            // 4. Executar o Parser para gerar a árvore sintática
            System.out.println("\n=== INICIANDO PARSER (ÁRVORE SINTÁTICA) ===");
            scanner = new Scanner(new FileReader("input.txt")); // Reinicia o scanner
            parser = new Parser(scanner);
            Symbol result = parser.parse(); // Captura o resultado do parser

            System.out.println("✅ Análise sintática concluída sem erros!");

            // 5. Exibir a árvore sintática, se disponível
            if (result != null && result.value != null) {
                System.out.println("\n=== ÁRVORE SINTÁTICA ===");
                System.out.println(result.value); // Certifique-se que o nó raiz tem toString() implementado
            } else {
                System.out.println("Árvore sintática não disponível.");
            }
        } catch (Exception e) {
            System.err.println("❌ Erro durante a análise: " + e.getMessage());
            e.printStackTrace();
        }
    }
}