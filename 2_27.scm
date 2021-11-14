(define (deep-reverse items)
  (define (iter x result)
    (if (null? x)
	result
	(if (not (pair? (car x)))
	    (iter (cdr x) (append (list (car x)) result))
	    (iter (cdr x) (cons (deep-reverse (car x)) result)))))
  (iter items '()))


(display (deep-reverse (list 1 2 (list 3 4) 5 6 (list 7 9 11 14 19) 99)))
