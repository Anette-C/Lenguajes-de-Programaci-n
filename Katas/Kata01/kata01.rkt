#lang racket

(define(cuenta-atras n)
(if (= n 0)
    '()
    (cons n (cuenta-atras (- n 1)))))

 (displayln (cuenta-atras 5))
(displayln (cuenta-atras 1))
(displayln (cuenta-atras 0))  