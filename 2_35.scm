(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))


(define (count-leaves t)
  (newline)
  (display t)
  (accumulate
   (lambda (x y)
     (+
      (if (pair? x)
	  (count-leaves x)
	  1)
      y))
   0
   t))
