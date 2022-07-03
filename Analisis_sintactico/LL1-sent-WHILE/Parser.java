import java.io.FileReader;
import java.io.IOException;
import java.io.FileReader;

class Parser {

private static int token;
private static Yylex lex;
private static int yylex() {
	int token = 0;
	try {
		token = lex.yylex();
	} catch (IOException e) {
		System.out.println("IOException");
		System.exit(0);
	}
	return token;
}

public static void main(String[] arg) {
    if (arg.length>0) {
        try {
            lex = new Yylex(new FileReader(arg[0]));
            /// .... A completar .....
        } catch (IOException e) {
        } 
    }
}

/// .... A completar .....

}