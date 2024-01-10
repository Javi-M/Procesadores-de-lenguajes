import java.io.IOException;
import java.io.FileReader;

public class cpv {
	public static int a = 0;
	public static int b = 0;
	public static int c = 0;
	public static int d = 0;

	public static void main(String[] args) {
		if(args.length>0){
			try{
				Yylex lex = new Yylex(new FileReader(args[0]));
				
				while (lex.yylex() != Yylex.YYEOF) {}

				System.out.println("A " + a);
				System.out.println("B " + b);
				System.out.println("C " + c);
				System.out.println("D " + d);

			} catch (IOException e){}
		}
	}
}



