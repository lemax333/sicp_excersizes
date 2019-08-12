(define (mul a b)
	(cond ((= b 1) a)
				((even? b) (mul (double a) (halve b)))
				(else (+ a (mul a (- b 1))))))

(define (double a)
	(+ a a))

(define (halve a)
	(/ a 2))
