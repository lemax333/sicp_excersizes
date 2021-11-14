(define (custom-cons x y)
  (define (dispatch m)
    (if (= m 0)
	x
	y))
  dispatch)

(define (custom-car z) (z 0))
(define (custom-cdr z) (z 1))
