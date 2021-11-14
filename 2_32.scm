(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map
		      (lambda (r)		     
			(append (list (car s)) r))
		      rest)))))
