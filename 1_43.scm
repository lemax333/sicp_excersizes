(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))


;;recursive
(define (repeated-rec f times)
  (if (<= times 1)
      (lambda (x) (f x))
      (compose f (repeated-rec f (- times 1)))))


;;iterative
(define (repeated-iter f times)
  (lambda (x)
    (if (= times 1)
	(f x)
	((repeated-iter (compose f f) (- times 1)) x))))
