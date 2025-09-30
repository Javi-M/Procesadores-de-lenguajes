
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

## JCom
Contar los caracteres dentro de cada tipo de comentario en Java:
`//`, `/* */` y `/** */` (sin contar los slashes y asteriscos de los propios
comentarios).


## rmw
(JFlex y Java) Programa capaz de sustituir todas las variables de un script del Shell (.sh) por su valor.




