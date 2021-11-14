(define (square x) (* x x ))

(define (square-list1 items)
  (if (null? items)
      items
      (cons
       (square (car items)) (square-list1 (cdr items)))))


(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
	    (map proc (cdr items)))))
      
(define (square-list2 items)
  (map square items))

(newline)
(display (square-list1 (list 1 2 3 4)))
(newline)
(display (square-list2 (list 1 2 3 4)))
