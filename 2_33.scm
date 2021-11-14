(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else (+ (sum-odd-squares (car tree))
		 (sum-odd-squares (cdr tree))))))


(define (even-fibs n)
  (define (next k)
    (if (> k n)
	'()
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))


(define (sum-odd-squares tree)
  (accumulate
   + 0 (map square (filter odd? (enumerate-tree tree)))))

(define (product-odd-squares tree)
  (accumulate
   * 1 (map square (filter odd? (enumerate-tree tree)))))

;; excersize 2.33
(define (map p sequence)
  (accumulate (lambda (x y)
		(cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons
	      seq2 seq1))

(define (length sequence)
  (accumulate
   (lambda (x y) (+ 1 y)) 0 sequence))
