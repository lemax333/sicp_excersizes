(define (fringe tree)
  (if (null? tree)
      '()
      (if (pair? (car tree))
	  (append (fringe (car tree)) (fringe (cdr tree)))
	  (cons (car tree) (fringe (cdr tree))))))

(display (fringe (list 1 2 (list 3 4) 5 6 (list 7 9 11 14 19) 99)))
