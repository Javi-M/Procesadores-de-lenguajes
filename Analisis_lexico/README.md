
Este directorio contiene ejercicios en lo relativo al análisis léxico. Cada subdirectorio será un ejercicio.

# Ejercicios de análisis léxico
Serán analizadores léxicos implementados en Java y  JFLEX.

## cpv
Analizador léxico que cuenta cuatro tipos de palabras según la distribución de las vocales.
Estos cuatro grupos; A, B, C, y D son:
* A: Palabras que tienen al menos dos vocales seguidas y terminan en vocal.
* B: Palabras que NO tienen dos vocales seguidas y terminan en vocal.
* C: Palabras que tienen al menos dos vocales seguidas y terminan en consonante.
* D: Palabras que NO tienen dos vocales seguidas y terminan en consonante.

El programa debe poder compilarse con las instrucciones:
```bash
jflex cpv.lex
javac *.java
```
Y debe poder ejecutarse con:
```bash
java cpv archivo.txt
```
(`archivo.txt` es el archivo que analiza).

## wc
Cuenta el número de líneas, palabras y caracteres que hay en un fichero.
El programa debe poder compilarse con las instrucciones:
```bash
jflex cpv.lex
javac *.java
```

Y debe poder ejecutarse con:
```bash
java wc archivo.txt
```

# Sobre el Lexer generado
Tras que JFlex interprete el archivo *.lex, genera una clase que por defecto se llama Yylex.java, a la que querremos acceder desde el método `main`. 

El objeto que creemos a partir de esta clase tendrá los siguentes métodos:
* `String yytext()`: devuelve el texto de entrada que ha hecho _match_.
* `int yylength()`: 
* `char yycharat(int pos)`: 