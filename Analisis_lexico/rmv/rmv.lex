
/* Vacío */

%%

VarId			= [a-zA-Z_][a-zA-Z0-9_]*
Value		  = [a-zA-Z][a-zA-Z0-9_]*
Special  	= [\".]
EndOfCommand			= ";" | \r\n | [\r\n\u2028\u2029\u000B\u000C\u0085]

%{
	String  variable = "";
	String  value    = "";
	void resetValues(){
		variable = "";
		value    = "";
	}
%}

%standalone

%xstate READING_SIMPLE_VALUE, READING_COMPLEX_VALUE, READING_COMMAND

%%

/* Yyinitial: cuando se empieza a leer un nuevo comando */
{VarId}=\"		    {
										System.out.println("Empieza READING_COMPLEX_VALUE");
                    rmv.printLineText = false;
										variable = yytext().substring(0, yytext().length()-2);
										yybegin(READING_COMPLEX_VALUE);
										return 1;
									}

{VarId}=					{
                    System.out.println("Empieza READING_SIMPLE_VALUE");
                    
                    rmv.printLineText = false;
										variable = yytext().substring(0, yytext().length()-1);
										yybegin(READING_SIMPLE_VALUE);
										return 1;
									}

/* Otros comandos bash. 2 opciones: sustituir $varIds  o no (dentro de comillas) */
.                 {
                    System.out.println("Empieza READING_COMMAND");
                    
                    rmv.printLineText = false;
                    rmv.lineText.concat(yytext());
                    yybegin(READING_COMMAND);
                    return 1;
                  }	

{EndOfCommand}   	{ resetValues(); }



<READING_SIMPLE_VALUE> {
\${VarId}         { 
                    value = TablaSimbolos.get(yytext());
                    TablaSimbolos.put(variable, value);
                    resetValues();
                    yybegin(YYINITIAL);
                    return 1;
                  }
                  
{Value}           {
                    TablaSimbolos.put(variable, yytext());
                    resetValues();
                    yybegin(YYINITIAL);
                    rmv.printLineText = false;
                    return 1;
                  }
                  
{EndOfCommand}    { 
                    yybegin(YYINITIAL); 
                    return 1;
                  }

/* Espacios en blanco, tabulaciones u otras cosas irrelevantes */
.                 {return 1;}

}


<READING_COMPLEX_VALUE>{
	/* Llamada a variable: buscar en TAS y sustituir */
	\${VarId} 				{  
	                     System.out.println("Reading complex value -> varId" + yytext());
	                     value.concat(TablaSimbolos.get(yytext()));
	                     return 1;
	                  }
	
	/* Caracter especial a incluir literalmente */
	\\{Special}       { // Incluir solamente el caracter especial y no el backslash
	                    System.out.println("Reading complex value -> Special: " + yytext());
											value.concat(yytext().substring(1, yytext().length()));
											return 1;
										}

  /* Fin de lectura del valor */
  \"                {
                      TablaSimbolos.put(variable, value);
                      resetValues();
                      return 1;
                    } 

	/* Cualquier otro caracter: espacios, backslash, etc. */
	.									{
											value.concat(yytext());
											return 1;
										}				
 								
	{EndOfCommand}    {
                     yybegin(YYINITIAL);
                     return 1;
                    }
}	

/* Es decir, se lee otra cosa que no es una asignacion
y por tanto se busca si hay que realizar sustituciones
para construir la linea de texto para el .rmv */
<READING_COMMAND>{
	/* No hay sustituciones. Se añade literalmente todo */
	"\"" [^\"]* "\""	{
										 rmv.lineText.concat(yytext());
										 return 1;
										}


	/* Es posiblemente una variable de la TablaSimbolos */
	\${VarId}					{
										 rmv.lineText.concat(TablaSimbolos.get(yytext()));
										 return 1;
										}
										
	.                 {
	                   rmv.lineText.concat(yytext());
	                   return 1;
	                  }						
	                  			
	{EndOfCommand}    {
	                   rmv.printLineText = true;
	                   resetValues();
	                   yybegin(YYINITIAL);
	                   return 1;
	                  }
}