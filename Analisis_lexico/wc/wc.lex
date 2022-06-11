
%%

%line /*switches line counting on (yyline)*/

%{
	int lineas = 0;
	int palabras = 0;
	int caracteres = 0;
%}

%%

<<EOF>> 			{lineas = yyline;} //El num. lineas es la linea en la que esta el EOF.
[^] 				{/*Ignorar*/}
