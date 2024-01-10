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
	// Aqui se construye el texto que se va insertando en el nuevo archivo .rmv
	public static String lineText = "";
	public static Boolean printLineText = false; // Señal de que ya esta listo para escribir
	  
    public static void main(String arg[]) 
    {
    	if (arg.length > 0) 
    	{
    	  try 
        {
  			Yylex lex = null;
  			lex 			= new Yylex(new FileReader(arg[0]));
  			
  			File newFile = new File(arg[0].concat(".rmv"));
  			newFile.createNewFile();
  			FileWriter fileWriter = new FileWriter(newFile);
  			
  			System.out.println("Punto 1"); 
  			
  			int token;
  			/* PROCESO DE ESCRITURA EN NUEVO ARCHIVO */
  			while(!lex.yyatEOF()){
  			  token = lex.yylex();
  			  System.out.println("Punto 2"); 
  			  System.out.println("Lexema: " + lex.yytext());
  				
  			  if(printLineText){
  					fileWriter.append(lineText);
  				}
  				lineText = "";
				
  				fileWriter.append("hola mundo");
  				fileWriter.close();
			}
			
			if (arg.length > 1 && arg[1].equals("-debug")) 
			{	            	
				TablaSimbolos.dump();
			}
	      } catch (IOException e) {} 
    	}
    }
}	
