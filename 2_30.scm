(define (square x) (* x x ))

(define (square-node node)
  (if (pair? node)
      (square-tree node)
      (square node)))

(define (square-tree items)
  (if (null? items)
      items
      (cons
       (square-node (car items)) (square-tree (cdr items)))))

(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square-tree1 items)
  (if (null? items)
      items
      (map (lambda (sub-tree)
	     (if (pair? sub-tree)
		 (square-tree1 sub-tree)
		 (square sub-tree)))
	   items)))

(define tree (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(newline)
(display (square-tree tree))
(newline)
(display (square-tree1 tree))
;;(1 (4 (9 16) 25) (36 49))
