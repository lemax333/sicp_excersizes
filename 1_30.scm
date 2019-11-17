(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (+ result (term a)))))
	(iter a 0))

(define (sum term a next b)
	(if (> a b)
			0
			(+ (term a)
				 (sum term (next a) next b))))

(define (inc a) (+ a 1))

(define (identity x) x)

(define (sum-ints a b)
	(sum identity a inc b))

(define (sum-ints-iter a b)
	(sum identity a inc b))

