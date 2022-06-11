import java.io.IOException;
import java.io.FileReader;

public class wc {
	public static void main(String[] args){
	
		if(args.length == 0) return;
		
		try{
			Yylex lex = new Yylex(new FileReader(args[0]));
			
			while(lex.yylex() != -1) {
	                
	        }
			System.out.print(lex.lineas + "\t");
			System.out.print(lex.palabras + "\t");
			System.out.print(lex.caracteres + " ");
			System.out.println(args[0]);
			
		} catch(IOException e){}
	}
}
