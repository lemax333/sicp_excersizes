(define (cust-cons x y)
  (lambda (m) (m x y)))
(define (cust-car z)
  (z (lambda (p q) p)))
(define (cust-cdr z)
  (z (lambda (p q) q)))

(newline)
(display (cust-car (cust-cons 7 9)))
(newline)
(display (cust-cdr (cust-cons 7 9)))


;; (car (cons x y)) 
;; (car (lambda (m) (m x y))) 
;; ((lambda (m) (m x y)) (lambda (p q) p)) 
;; ((lambda (p q) p) x y) 
;; x 
