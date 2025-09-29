import java.io.FileReader;
import java.io.IOException;

public class wc {

    public static void main(String[] args) {
        if (args.length > 0) {
            try {
                Yylex lex = new Yylex(new FileReader(args[0]));

                while (lex.yylex() != Yylex.YYEOF)
                    ;

                System.out.println(lex.lineas + "\t" + lex.palabras + "\t"
                        + lex.caracteres + " " + args[0]);

            } catch (IOException e) {
                System.err.println("Error: '" + e.getMessage() + "'.");
            }
        }
    }
}
