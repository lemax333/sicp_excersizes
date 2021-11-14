(define tolerance 0.00001) 

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (if (<= times 1)
      (lambda (x) (f x))
      (compose f (repeated f (- times 1)))))

(define (average x y) 
   (/ (+ x y) 2.0))

(define (average-damp f) 
  (lambda (x) (average x (f x))))

(define (power x n)
  (if (<= n 1)
      x
      (* x (power x (- n 1)))))

(define (root x pwr m)
  (fixed-point
   ((repeated average-damp m) (lambda (y) (/ x (power y (- pwr 1)))))
    1.0))
