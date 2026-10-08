#lang racket

(define (mayor-de-dos a b)
(if (> a b) a b))
 (define (maximo lst)
 (if (null? (cdr lst))
 (car lst)
(mayor-de-dos (car lst) (maximo (cdr lst)))))
 
 (maximo '(3 1 4 1 5 9 2 6))
 (maximo '()) // violación de contrato: la lista no puede estar vacía