(define (enumerate-interval initial n)
  (define (iter x)
    (if (> x n)
	'()
	(cons x (iter (+ x 1)))))
  (iter initial))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))

(define (unique-triples n)
  (flatmap
   (lambda (i)
      (flatmap (lambda (j)
		 (map (lambda (k) (list i j k))
		      (enumerate-interval 1 (- j 1))))
	       (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (find-triples n s)
  (filter (lambda (set) (= (accumulate + 0 set) s))
	  (unique-triples n)))

(newline)
(display (find-triples 20 30))
