(define (prime? x) 
  (define (test divisor) 
    (cond ((> (* divisor divisor) x) true) 
	  ((= 0 (remainder x divisor)) false) 
	  (else (test (+ divisor 1))))) 
  (test 2))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-interval initial n)
  (define (iter x)
    (if (> x n)
	'()
	(cons x (iter (+ x 1)))))
  (iter initial))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
	  (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
