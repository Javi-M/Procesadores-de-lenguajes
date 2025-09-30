# El Lexer generado
Tras que JFlex interprete el archivo `*.lex` o `*.flex`, genera una clase que 
por defecto se llama `Yylex.java`. Esta es la clase del *scanner*. 

Los objetos de esta clase tienen los siguentes métodos:
* `int yylex()`: Devuelve un entero, correspondiente al token del lexema 
    reconocido.
* `String yytext()`: Devuelve el lexema que se acaba de reconocer (el texto que 
    ha hecho _match_ con una ER).
* `int yylength()`: 
* `char yycharat(int pos)`

