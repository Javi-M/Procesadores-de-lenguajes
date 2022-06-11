
%%

%int /*Causes the scanning method to be declared as returning Java type int*/

%line /*switches line counting on (yyline)*/

%{
	public int lineas = 0;
	public int palabras = 0;
	public int caracteres = 0;
%}

%%


[^] 				{/*Ignorar*/}
