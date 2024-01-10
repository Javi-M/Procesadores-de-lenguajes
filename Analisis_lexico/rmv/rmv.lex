/* No hay tratamiento si hay errores en el script donde se sutituyen variables.
se ignoran dichos lexemas */

/* Vacío */

%%

%int


EOL               = [\r\n\u2028\u2029\u000B\u000C\u0085]
EndOfInstruction  = [$|;{:EOL:}]
Special           = [.]
VarId			        = [a-zA-Z_][a-zA-Z0-9_]*
Value             = [a-zA-Z][a-zA-Z0-9_]*

/* id de varibale y su valor que se insertaran en la Tabla de Simbolos */
%{
	String  constructingVariable = "";
	String  constructingValue    = "";
%}

%xstate YYINITIAL, READING_SIMPLE_VALUE, READING_COMPLEX_VALUE, READING_COMMAND

%%

/* Yyinitial: cuando se empieza a leer una nueva instruccion */
<YYINITIAL>
{
{VarId}=\"		    {
                    constructingVariable = yytext().substring(0, yytext().length()-2);
                    yybegin(READING_COMPLEX_VALUE);
                    return Token.COMPLEX_VAR_ID;
                  }

{VarId}=					 {
                    constructingVariable = yytext().substring(0, yytext().length()-1);
                    yybegin(READING_SIMPLE_VALUE);
                    return Token.SIMPLE_VAR_ID;
                   }

{EndOfInstruction}  {
                      constructingValue    = "";
                      constructingVariable = "";
                      return Token.EOI;
                    }

.                   {
                      rmv.lineText.concat(yytext());
                      yybegin(READING_COMMAND);
                      return Token.OTHER;
                    }	

[^] {}
}




<READING_SIMPLE_VALUE>
{
\${VarId}           { 
                      String value = TablaSimbolos.get(yytext());
                      TablaSimbolos.put(yytext(), value);
                      yybegin(YYINITIAL);
                      return Token.SIMPLE_VALUE;
                    }
                  
{Value}             {
                      TablaSimbolos.put(constructingVariable, yytext());
                      constructingVariable = "";
                      yybegin(YYINITIAL);
                      return Token.SIMPLE_VALUE;
                    }
                  
{EndOfInstruction}  {
                      constructingVariable = "";
                      constructingValue    = "";
                      yybegin(YYINITIAL); 
                      return Token.EOI;
                    }

/* Cualquier otra cosa en este estado es irrelevante */
.                   {
                      return Token.OTHER;
                    }

[^] {}
}


<READING_COMPLEX_VALUE>
{
/* Llamada a variable: buscar en TS y sustituir */
\${VarId} 				  {
                      constructingValue.concat(TablaSimbolos.get(yytext()));
                      return Token.OTHER;
                    }

/* Caracter especial a incluir literalmente NO TRATADO 
  (falta de especificacion en el enunciado) */
/* En su lugar: añadir cualquier caracter verbatim */
\\.                 { // Incluir el caracter y no el backslash reconocido
                      constructingValue.concat(yytext().substring(1, yytext().length()));
                      return Token.OTHER;
                    }

/* Fin de lectura del valor */
\"                  {
                      TablaSimbolos.put(constructingVariable, constructingValue);
                      constructingValue = "";
                      constructingVariable = "";
                      yybegin(YYINITIAL);
                      return Token.OTHER;
                    }

{EndOfInstruction}  {
                      yybegin(YYINITIAL);
                      return Token.EOI;
                    }

/* Cualquier otra acosa: incluir tal cual */
.	  			          {
                      constructingValue.concat(yytext());
                      return 1;
                    
                    }
[^] {}	
}	






/* Es decir, se lee otra cosa que no es una asignacion
y por tanto se busca si hay que realizar sustituciones
para construir la linea de texto para el .rmv */
<READING_COMMAND>
{
/* No hay sustituciones. Se añade literalmente todo */
\" ~\"	            {
                      rmv.lineText.concat(yytext());
                      return Token.OTHER;
                    }


/* Es posiblemente una variable de la TablaSimbolos */
\${VarId}					  {
                      rmv.lineText.concat(TablaSimbolos.get(yytext()));
                      return Token.OTHER;
                    }
                  					
                        
{EndOfInstruction}  {
                      rmv.printLineText = true;
                      yybegin(YYINITIAL);
                      return Token.EOI;
                    }

/* El resto de caracteres: incluir tal cual */
.                   {
                      rmv.lineText.concat(yytext());
                      return Token.OTHER;
                    }

[^] {}

}

/* Otra cosa: ignorar */
[^] {}