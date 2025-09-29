/* USER CODE */

%%
/* DECLARATIONS AND OPTIONS */

%{
	public int palabras    = 0;
	public int lineas      = 0;
	public int caracteres  = 0;
%}

FinDeLinea     = \r|\n|\r\n
EspacioBlanco  = [ \t\f]
Palabra        = [^\t\n\r\ ]+ // Caracteres que no sean espacio en blanco o final de linea

%standalone // Usamos esta opcion cuando no usamos tokens, es decir, sin la clase Yytoken.
            // Es comun tambien poner %int en vez de %standalone
%8bit
%int //Causes the scanning method to be declared as returning Java type int

%%
/* LEXICAL RULES */

{Palabra}           { palabras++; caracteres += yylength(); }
{EspacioBlanco}     { caracteres++; }
{FinDeLinea}        { lineas++; caracteres += yylength(); }

// El contador de "Palabras" en realidad seria mejor nombrado como "ByteCounter"
// las nuevas lineas obviamente no son parte de palabras
