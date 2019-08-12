(define (mul a b)
	(cond ((= b 1) a)
				((even? b) (mul (double a) (halve b)))
				(else (+ a (mul a (- b 1))))))
		
(define (mul-iter a b)
	(iter a b 0))

(define (iter a b r)
  (newline)
  (display a) (display "_") (display b) (display "_") (display r)
	(cond ((= b 1) (+ a r))
				((= b 0) 0)
				((even? b) (iter (double a) (halve b) r))
				(else (iter a (- b 1) (+ r a)))))


(define (double a)
	(+ a a))

(define (halve a)
	(/ a 2))
