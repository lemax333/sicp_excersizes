(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(display (((double (double double)) inc) 5))

;; (double inc) -> (inc (inc)) (2x times)
;; ((double double) inc) -> (double (double inc) -> inc inc inc inc (4x times)
;; ((double (double double)) inc) -> (double (double (double (double inc)))) -> inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc (21x times)


