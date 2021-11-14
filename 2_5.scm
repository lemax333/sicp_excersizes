(define (power base exp)
  (if (= exp 0)
      1
      (* base (power base (- exp 1)))))

(define (num-cons a b)
  (* (power 2 a) (power 3 b)))

(define (num-car z)
  (cond ((= 1 z) 0)
	((even? z) (+ 1 (num-car (/ z 2))))
	(else (num-car (/ z 3)))))

(define (num-cdr z)
  (cond ((= 1 z) 0)
	((even? z) (num-cdr (/ z 2)))
	(else (+ 1 (num-cdr (/ z 3))))))

(define z (num-cons 10 20)) 
(num-car z) ;; 10 
(num-cdr z) ;; 20 

(define zeroes (num-cons 0 0)) 
(num-car zeroes) ;; 0 
(num-cdr zeroes) ;; 0 
