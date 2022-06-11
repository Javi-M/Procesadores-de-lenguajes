
%%

%int /*Causes the scanning method to be declared as returning Java type int*/

%line /*switches line counting on (yyline)*/

%{
	public int lineas = 0;
	public int palabras = 0;
	public int caracteres = 0;
%}

palabra = [a-zA-Z]+ /* ESTA NO ES LA SOLUCION */



string = [^ \t\n\f\r]+ 

%%

{string}			{
						palabras++;
						caracteres += yytext().length();
					}
					 
[^] 				{
						caracteres++;
						lineas = yyline+1; // Porque empieza en la linea 0 
					}
