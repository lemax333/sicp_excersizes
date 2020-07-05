(define tolerance 0.00001)
(define (fixed-point f first-guess)
	;;closeenouth
	(define (close-enough v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try-guess f guess)
		(display guess)
		(newline)
		(let ((next (f guess)))
			(if (close-enough guess next)
					next
					(try-guess f next))))
	(try-guess f first-guess))

(define (average x y)
	(/ (+ x y) 2))

(fixed-point (lambda (y) (/ (log 1000) (log y))) 1.1)
(newline)
(display "Av dumping")
(fixed-point (lambda (y) (average y (/ (log 1000) (log y)))) 1.1)
