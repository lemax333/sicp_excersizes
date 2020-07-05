(define tolerance 0.00001)
(define (fixed-point f first-guess)
	;;closeenouth
	(define (close-enough v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try-guess f guess)
		(let ((next (f guess)))
			(if (close-enough guess next)
					next
					(try-guess f next))))
	(try-guess f first-guess))

(fixed-point (lambda (y) (+ 1 (/ 1 y))) 1.0)
