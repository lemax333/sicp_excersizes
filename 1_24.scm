(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (fast-prime? n 100)
			(report-prime (- (runtime) start-time))
			#f))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (search-for-primes start-num count)
	(if (> count 0)
			(if (not (timed-prime-test start-num))
					(search-for-primes (next-odd start-num) count)
					(search-for-primes (next-odd start-num) (- count 1)))))

(define (next-odd n)
	(if (even? n)
			(+ n 1)
			(+ n 2)))
