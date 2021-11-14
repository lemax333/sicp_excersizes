(define (average x1 x2) (/ (+ x1 x2) 2))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment s_point e_point) (cons s_point e_point))
(define (start-segment line) (car line))
(define (end-segment line) (cdr line))

(define (midpoint-segment line)
  (make-point (average
	       (x-point (start-segment line))
	       (x-point (end-segment line)))
	      (average
	       (y-point (start-segment line))
	       (y-point (end-segment line)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (test) 
  (let ((line1 (make-segment (make-point 1 1) (make-point 5 5))))
    (print-point (start-segment line1))
    (newline)
    (print-point (end-segment line1))
    (print-point (midpoint-segment line1))
    ))

(test)
