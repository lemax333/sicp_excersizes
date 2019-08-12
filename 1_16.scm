(define (fast-expt-iter b n)
	(iterate b n 1))

(define (iterate b n a)
	(cond ((= n 1) (* b  a))
				((= n 0) 1)
				((even? n) (iterate (square b) (/ n 2) a)
				(else (iterate b (- n 1) (* a b)))))


(define (even? n)
  (= (remainder n 2) 0))

(define (square a)
	(* a a))
