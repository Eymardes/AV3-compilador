import java.io.FileReader;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Inicializa o Scanner (JFlex) com o arquivo de entrada
            Scanner scanner = new Scanner(new FileReader("input.txt"));

            // Testa a análise léxica
            boolean lexicoOk = true;
            try {
                Symbol token;
                while ((token = scanner.next_token()).sym != sym.EOF) {
                    // Apenas percorre os tokens para validar a análise léxica
                }
            } catch (Exception lex) {
                lexicoOk = false;
                System.err.println("❌ Erro na análise léxica: " + lex.getMessage());
            }

            if (!lexicoOk) {
                System.out.println("Arquivo NÃO passou na análise léxica.");
                return;
            } else {
                System.out.println("Arquivo passou na análise léxica.");
            }

            // Reinicializa o scanner para análise sintática
            scanner = new Scanner(new FileReader("input.txt"));
            Parser parser = new Parser(scanner);
            try {
                parser.parse();
                System.out.println("Arquivo passou na análise sintática.");
                System.out.println("✅ Análise léxica e sintática concluída com sucesso!");
            } catch (Exception syn) {
                System.err.println("❌ Erro na análise sintática: " + syn.getMessage());
                System.out.println("Arquivo NÃO passou na análise sintática.");
            }
        } catch (Exception e) {
            System.err.println("❌ Erro geral: " + e.getMessage());
            e.printStackTrace();
        }
    }
}