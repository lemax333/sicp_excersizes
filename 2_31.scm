(define (square x) (* x x ))

(define (tree-map proc items)
  (if (null? items)
      items
      (if (pair? (car items))
	  (cons (tree-map proc (car items))
		(tree-map proc (cdr items)))
	  (cons (proc (car items))
		(tree-map proc (cdr items))))))

(define (square-tree tree) (tree-map square tree))

(define tree (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(newline)
(display (square-tree tree))
;;(1 (4 (9 16) 25) (36 49))
