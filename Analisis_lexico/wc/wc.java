import java.io.IOException;
import java.io.FileReader;

public class wc {

	public static void main(String[] args){
	
		if(args.length() = 0) return;
		
		try{
			Yylex lex = new Yylex(new FileReader(args[0]));
			
			while(lex.yylex() != -1){
			
			}

			System.out.print(lex.lineas);
			System.out.print(lex.palabras);
			System.out.print(lex.caracteres);
			System.out.print(args[0]);
			
		} catch(IOException e){}
	}
}
