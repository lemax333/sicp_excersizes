(define (reverse l)
  (define (iter l n)
    (if (= n 0)       
	(list (car l))
	(cons (list-ref l n) (iter l (- n 1)))))
  (iter l (- (length l) 1)))

(define r (reverse (list 1 4 9 16 25)))
(display (reverse (list 1 4 9 16 25)))

;;(cdr (list 3))
