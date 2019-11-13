(define (fast-prime? n) (iter_prime n (- n 1)))

(define (iter_prime n times)
	(fermats-test n times)
	(if (= times 1)
			(display "Finished")
			(iter_prime n (- times 1))))

(define (fermats-test n a)
	(newline) (newline)
	(display "########## testing for a=") (display a) (newline)
	(display (= (expmod a (- n 1) n) 1)))

(define (expmod base exp m)
	  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-log (expmod base (/ exp 2) m) base (/ exp 2))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square-log n base exp)
	(display "n:") (display n) (display " base:") (display base) (display " exp:") (display exp) (newline)
	(square n))

