(define (inc a) (+ a 1))

(define (identity x) x)

(define (accumulate combiner null-value term a next b)
	(if (> a b)
			null-value
			(combiner (term a)
								(accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
				result
				(iter (next a) (combiner result (term a)))))
	(iter a null-value))

(define (multiply a b) (* a b))
(define (add a b) (+ a b))

(define (product-ints a b)
	(accumulate multiply 1 identity a inc b))

(define (sum-ints a b)
	(accumulate add 0 identity a inc b))

(define (product-ints-iter a b)
	(accumulate-iter multiply 1 identity a inc b))

(define (sum-ints-iter a b)
	(accumulate-iter add 0 identity a inc b))
