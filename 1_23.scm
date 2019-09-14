(define (prime-opt? n)
	(= n (smallest-divisor-optimized n)))

(define (smallest-divisor-optimized n)
  (find-divisor-optimized n 2))

(define (find-divisor-optimized n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
				(else (find-divisor-optimized n (next test-divisor)))))

(define (next n)
	(if (= n 2)
			(+ n 1)
			(+ n 2)))

(define (timed-prime-test-opt n)
	(newline)
	(display n)
	(start-prime-test-opt n (runtime)))

(define (start-prime-test-opt n start-time)
	(if (prime-opt? n)
			(report-prime (- (runtime) start-time))
			#f))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (divides? a b)
  (= (remainder b a) 0))
