import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/* EL PLAN
 * 1. Crea un archivo, copia del original, acabado en ".rmv"
 * 2. Ir leyendo comando a comando del archivo .sh
 * 	Si es una asignación 		 -> No añadir a .rmv, sólo a la tabla de símbolos
 * 		Si es simple 	 		 -> Añadir valor
 * 		Si es compuesto ("$...") -> Procesar sustituciones
 *  Si es otro comando   -> Procesar sustituciones
 */

public class rmv 
{
	// Aqui se construye  lina que se va insertando en el nuevo archivo .rmv
	public static String lineText = "";
	public static Boolean printLineText = false; // Señal de que ya esta listo para escribir
	  
	public static void main(String arg[]) 
	{
		if (arg.length > 0) 
		{
			try 
			{
			Yylex lex =  new Yylex(new FileReader(arg[0]));
			
			FileWriter fileWriter = new FileWriter(arg[0].concat(".rmv"));
			
			int token = lex.yylex();

			/* PROCESO DE RE-ESCRITURA EN NUEVO ARCHIVO */
			while(token != Yylex.YYEOF)
			{ 
				System.out.println("------------------");
				System.out.println("Lexema: " + lex.yytext());
				System.out.println("Posible linea: " + lineText);
				System.out.println("Estado lexico: " + lex.yystate());
				System.out.println("Token: " + lex.yylex());

				if(printLineText){
					System.out.println("printLineText: true");
				}else{
					System.out.println("printLineText: false");
				}

				token = lex.yylex();

				if((token == Token.EOI || token == -1) && printLineText){
					System.out.println("Linea añadiendo: " + lineText);
					fileWriter.append(lineText + '\n');
					printLineText = false;
					lineText = "";
				}

			}
		System.out.println("------------------");
		System.out.println("Lexema: " + lex.yytext());
		System.out.println("Posible linea: " + lineText);
		System.out.println("Estado lexico: " + lex.yystate());
		System.out.println("Token: " + lex.yylex());
		if(printLineText){
					System.out.println("printLineText: true");
				}else{
					System.out.println("printLineText: false");
				}

		fileWriter.close();

		if (arg.length > 1 && arg[1].equals("-debug")) 
		{	            	
			TablaSimbolos.dump();
		}

		} catch (IOException e) {} 
		}
	}
}	
