(define (for-each proc items)
  (if (not (null? items))
      ((lambda (x)
	 (proc (car x))
	 (for-each proc (cdr x))) items)))

(for-each (lambda (x)
	    (newline)
	    (display x))
	  (list 57 321 88))
