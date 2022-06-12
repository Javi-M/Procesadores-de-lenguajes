
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
(JFlex y Java) Cuenta el número de líneas, palabras y caracteres que hay en un fichero.
El programa debe poder compilarse con las instrucciones:
```bash
jflex cpv.lex
javac *.java
```

Y debe poder ejecutarse con:
```bash
java wc archivo.txt
```

## rmw
(JFlex y Java) Programa capaz de sustituir todas las variables de un script del Shell (.sh) por su valor.


# Sobre el Lexer generado
Tras que JFlex interprete el archivo *.lex, genera una clase que por defecto se llama Yylex.java, a la que querremos acceder desde el método `main`. 

Los objetos de esta clase tienen los siguentes métodos:
* `String yytext()`: Devuelve el lexema que se acaba de reconocer (el texto que ha hecho _match_ con una ER).
* `int yylength()`: 
* `char yycharat(int pos)`: 
* `int yylex()`: Devuelve un entero, correspondiente al token del lexema reconocido.



