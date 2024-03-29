(define (make-vect x y)
  (cons x y))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (add-vect v1 v2) (make-vect (+ (xcor-vect v1) (xcor-vect v2))
				    (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2) (make-vect (- (xcor-vect v1) (xcor-vect v2))
				    (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v1 scalar) (make-vect (* (xcor-vect v1) scalar)
					  (* (ycor-vect v1) scalar)))


(define (make-segment start end)
  (cons start end))

(define (start-segment line)
  (car line))
(define (end-segment line)
  (cdr line))
