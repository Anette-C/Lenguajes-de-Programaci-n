#racket
 ;Ejercicio integrador de la unidad 0

 ;Sección 1: representación
(struct num-exp (n) #:transparent)
(struct id-exp (nombre) #:transparent)
(struct add-exp (e1 e2) #:transparent)
(struct mul-exp (e1 e2) #:transparent)
(struct with-exp (nombre expr cuerpo) #:transparent)

;Sección 2: la función calc
(define (calc e asocs)
(match e
[(num-exp n) n]
[(id-exp nombre) (buscar nombre asocs)]
[(add-exp e1 e2) (+ (calc e1 asocs) (calc e2 asocs))]
[(mul-exp e1 e2) (* (calc e1 asocs) (calc e2 asocs))]
[(with-exp nombre expr cuerpo)(calc cuerpo (extender asocs nombre (calc expr asocs)))]))

(define (asocs-vacias) '())
(define (extender asocs nombre valor)
(cons (cons nombre valor) asocs))
(define (buscar nombre asocs)
(cdr (assoc nombre asocs)))

;a) add(3, mul(2, 4))
(add-exp (num-exp 3) (mul-exp (num-exp 2) (num-exp 4)))
;prueba
(calc (add-exp (num-exp 3) (mul-exp (num-exp 2) (num-exp 4))) (asocs-vacias))

;b) with y = add(3, 4) in mul(y, y)
(with-exp 'y
(add-exp (num-exp 3) (num-exp 4))
(mul-exp (id-exp 'y) (id-exp 'y)))
;prueba 
(calc (with-exp 'y
(add-exp (num-exp 3) (num-exp 4))
(mul-exp (id-exp 'y) (id-exp 'y))) (asocs-vacias))
22
;c) with x = add(2, 3) in with y = mul(x, 2) in add(x, y)
(with-exp 'x
(add-exp (num-exp 2) (num-exp 3))
(with-exp 'y 
(mul-exp (id-exp 'x) (num-exp 2))
(add-exp (id-exp 'x) (id-exp 'y))))
;Prueba
(calc (with-exp 'x
(add-exp (num-exp 2) (num-exp 3))
(with-exp 'y 
(mul-exp (id-exp 'x) (num-exp 2))
(add-exp (id-exp 'x) (id-exp 'y)))) (asocs-vacias))

;d) with a = 5 in mul(with b = add(a, 1) in b, a)
(with-exp 'a
(num-exp 5)
(mul-exp(with-exp 'b (add-exp(id-exp 'a)(num-exp 1))(id-exp 'b))(id-exp 'a)))
;Prueba
(calc (with-exp 'a
(num-exp 5)
(mul-exp(with-exp 'b (add-exp(id-exp 'a)(num-exp 1))(id-exp 'b))(id-exp 'a))) (asocs-vacias))

;Sección 3: el trazado
#|
Trazado de la expresión
with x = add(2, 3) in with y = mul(x, 2) in add(x, y)

N2=(num-exp 2)
N3= (num-exp 3)
A=(add-exp N2 N3)
M=(mul-exp x N2)
A1=(add-exp x y)
C=(with-exp y M A1)

(calc (with-exp x A C) sigma0)
[with] (calc C extend(sigma0, x, (calc A sigma0)))
[add] (calc C extend(sigma0, x, (calc N2 sigma0)+(calc N3 sigma0)))
[num] (calc C extend(sigma0, x, 2+3))
(calc C sigma1) -----------> con sigma1=extend(sigma0, x, 5)

(calc (with-exp y M A1) sigma1)
[with] (calc A1 extend(sigma1, y, (calc M sigma1)))
[mul] (calc A1 extend(sigma1, y, (calc (id-exp x) sigma1) * (calc N2 sigma1)))
[id]  (calc A1 extend(sigma1, y, lookup(x, sigma1) * (calc N2 sigma1)))
[num] (calc A1 extend(sigma1, y, 5 * 2))
= (calc A1 sigma2) -----------> con sigma2=extend(sigma1, y, 10)

(calc A1 sigma2)
= (calc (add-exp (id-exp x) (id-exp y)) sigma2)
= (calc (id-exp x) sigma2) + (calc (id-exp y) sigma2)                         [add]
= lookup(x, sigma2) + (calc (id-exp y) sigma2)                                [id]
= 5 + lookup(y, sigma2)                                                        [id]
= 5 + 10
= 15
|#