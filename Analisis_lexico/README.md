
Este directorio contiene ejercicios en lo relativo al análisis léxico. Cada subdirectorio será un ejercicio.

# Ejercicios de análisis léxico

## cpv
Analizador léxico que cuenta cuatro tipos de palabras según la distribución de las vocales.
Implementado en Java y  JFLEX.
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
