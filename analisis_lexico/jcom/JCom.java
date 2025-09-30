import java.io.*;

class JCom {
    public static void main(String args[]) {
        try {
            Yylex lex =  new Yylex(new FileReader(args[0]));

            while (lex.yylex() != Yylex.YYEOF)
                ;

            System.out.printf("//\t%d\n", lex.slash_cnt);
            System.out.printf("/*\t%d\n", lex.asterisk_cnt);
            System.out.printf("/**\t%d\n", lex.double_asterisk_cnt);

        } catch (IOException e) {
                System.err.println("Error: '" + e.getMessage() + "'.");
        }
    }
}
