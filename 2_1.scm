;;-n d -> -n d
;;n -d -> -n d

;;n d -> n d
;;-n -d -> n d

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (negative? x)
  (< x 0))
(define (positive? x)
  (>= x 0))

(define (make-rat-signed n d)
  (cond
   ((negative? d)
    (make-rat (* n -1) (* d -1)))
   (else (make-rat n d))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat-signed 1 2))
(define one-half-1 (make-rat-signed -1 -2))

(define minus-one-half (make-rat-signed -1 2))
(define minus-one-half-1 (make-rat-signed 1 -2))


(print-rat one-half)
(newline)
(print-rat one-half-1)
(newline)
(print-rat minus-one-half)
(newline)
(print-rat minus-one-half-1)
(newline)
