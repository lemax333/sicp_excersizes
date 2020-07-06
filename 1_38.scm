;;1 2 1 1 4 1 1 6 1 1 8
(define (cont-frac n d k)
	(define (frac i)
		(display (d i))
		(newline)
		(if (> i k)
				0
				(/ (n i) (+ (d i) (frac (+ 1 i))))))
	(frac 1))

(define (approx-e k)
	(define (d i)
		(if (= (modulo (+ i 1) 3) 0)
				(* (+ (/ i 3) (/ 1 3)) 2)
				1))
	(+ 2 (cont-frac (lambda (i) 1.0) d k)))

(display (approx-e 10))
