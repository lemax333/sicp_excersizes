(define (fast-prime? n times)
	(miller-rabin-test n times)
  (cond ((= times 1) true)
;;        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else (fast-prime? n (- times 1)))))

(define (miller-rabin-test n a)
	(display "testing for a:") (display a) (newline)
	(display (= (expmod a (- n 1) n) 1)) (newline) (display "#####") (newline))

(define (expmod base exp m)
	(cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-with-check (expmod base (/ exp 2) m) base (/ exp 2) m)
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square-with-check n base exp mod)
;;	(display "n:") (display n) (display " base:") (display base) (display " exp:") (display exp) (newline)
	(let ((n-square (square n)))
		(if (and
				 (not (or (= n (- mod 1))
									(= n 1)))
				 (= (remainder n-square mod) 1))
				0 ;; found non-trivial square root
				(square n))))
