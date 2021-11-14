(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))


;;recursive
(define (repeated f times)
  (if (<= times 1)
      (lambda (x) (f x))
      (compose f (repeated f (- times 1)))))

(define dx 0.00001)

(define (smoothe f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))


(define (repeated-smoothe f fold)
  (repeated smoothe fold) f)
