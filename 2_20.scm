(define (same-parity x . args)
  (define (iter x args)
    (if (null? args)
	args
	(if ((x-parity x) (car args))
	    (append (list (car args)) (iter x (cdr args)))
	    (iter x (cdr args)))))
  (cons x (iter x args)))

(define (x-parity x)
  (if (even? x)
      even?
      odd?))
