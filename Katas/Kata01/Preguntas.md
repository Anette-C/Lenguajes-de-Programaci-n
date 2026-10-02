Las dos versiones construyen la misma lista, y solo una tiene algo que cambia de valor mientras el programa corre.

 ¿Cuál, y qué es lo que cambia?
En Racket no cambia ninguna variable. cons no modifica nada, construye una lista nueva a partir de una que ya existía. En C++, resultado de i valen algo distinto en cada vuelta del ciclo.

¿Qué le cuesta a cada lenguaje meter un elemento por el
frente de una lista?
Las dos versiones dan lo mismo y cada lenguaje empuja hacia una. La recursiva de C++ es correcta, pero paga una copia del vector en cada llamada, así que el idioma del lenguaje es el ciclo. En Racket la lista se construye por el frente, que es justo lo que cons hace barato, así que ahí el idioma es la recursión

¿Esa diferencia explica por qué cada uno empuja hacia un lado?
si.