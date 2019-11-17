(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (+ result (term a)))))
	(iter a 0))

(define (product-iter term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (* result (term a)))))
	(iter a 1))

(define (product term a next b)
	(if (> a b)
			1
			(* (term a)
				 (product term (next a) next b))))

(define (inc a) (+ a 1))

(define (identity x) x)

(define (product-ints a b)
	(product identity a inc b))

(define (product-ints-iter a b)
	(product identity a inc b))

(define (factorial a)
	(product-ints 1 a))

(define (factorial-iter a)
	(product-ints-iter 1 a))


(define (pi-sum a b)
	(define (pi-term x)
		(/ 1.0 (* x (+ x 2))))
	(define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (pi-prod a b)
	(define (pi-term x)
;;		(display "(")(display x) (display "*") (display (+ x 2)) (display ")") (display "/") (display (square (+ x 1)))(newline)
		(/ (* x (+ x 2)) (square (+ x 1))))
	(define (pi-next x)
    (+ x 2.0))
  (product pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
(* 4 (pi-prod 1 8))
