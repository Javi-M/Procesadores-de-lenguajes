public class wc {

	public static void main(String[] args){
	
		if(args.length = 0) return;
		
		try{
			Yylex lex = new Yylex(new FileReader(args[0]));
			
			while(lex.yylex() != -1){
			
			}

			System.out.print(lex.lineas.toString());
			System.out.print(lex.palabras.toString());
			System.out.print(lex.caracteres.toString());
			System.out.print(args[0]);
			
		} catch(IOException e){}
	}
}
