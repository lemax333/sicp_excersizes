(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items '()))


(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items '()))


;; (1 2 3)

;; (1 2 3) nil
;; items = (2 3)
;; answer = (cons 1 nil)

;; (2 3) (1 nil)
;; items = (3)
;; answer = (cons 2 (cons 1 nil)) -> (2 1)

