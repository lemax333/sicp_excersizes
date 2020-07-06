;;recursive process
(define (cont-frac n d k)
	(define (frac i)
		(if (> i k)
				0
				(/ (n i) (+ (d i) (frac (+ 1 i))))))
	(frac 1))

;; iterative process
(define (cont-frac-iter n d k)
	(define (iter i res)
		(if (> i k)
				res
				(iter (+ i 1) (/ (n i) (+ (d i) res)))))
	(iter 1 0))

(define tolerance .000099)
(define gldn-ratio .6180)
(define (find-k n d k)
	(let ((approx (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
		(display approx) (display " ") (display k)
		(newline)
		(let ((error (- approx gldn-ratio)))
			(if (and (> error 0) (< error tolerance))
					k
					(find-k n d (+ k 1)))
			)))

(display (find-k (lambda (i) 1.0) (lambda (i) 1.0) 1))
(newline)
(newline)
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11))
