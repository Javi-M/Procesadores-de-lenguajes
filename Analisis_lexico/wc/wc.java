public class wc {

	public static void main(String[] args){
	
		if(args.length = 0) return;
		
		try{
			Yylex lex = new Yylex(new FileReader(args[0]));
			
			while(lex.yylex != -1){
			
			}
			
		} catch(IOException e){}
	}
}
