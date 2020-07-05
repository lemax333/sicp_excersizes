;;recursive process
(define (cont-frac n d k)
	(if (= k 0)
			(/ (n k) (d k))
			(/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

;; iterative process
(define (cont-frac-iter n d k)
	(define (iter n d k res)
		(if (< k 0)
				res
				(iter n d (- k 1) (/ (n k) (+ (d k) res)))))
	(iter n d k 0))

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
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10))
