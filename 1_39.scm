(define (cont-frac-minus n d k)
	(define (frac i)
		(display (n i))
		(newline)
		(if (> i k)
				0
				(/ (n i) (- (d i) (frac (+ 1 i))))))
	(frac 1))

(define (tan-cf x k)
	(cont-frac-minus
	 (lambda (i)
		 (if (= i 1)
				 x
				 (* x x)))
	 (lambda (i)
		 (- (* i 2.0) 1))
	 k))
