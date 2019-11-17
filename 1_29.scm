(define (inc a) (+ a 1))

(define (cube a) (* a a a ))

(define (identity x) x)

(define (sum term a next b)
	(if (> a b)
			0
			(+ (term a)
				 (sum term (next a) next b))))


(define (sum-cubes a b)
	(sum cube a inc b))

(define (sum-ints a b)
	(sum identity a inc b))

(define (integral f a b dx)
	(define (add-dx x)
	  (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b)
		 dx))

(define (simps-integral f a b n)
	(define (h)
		(/ (- b a) n))

	(define (add-h x)
		(+ x (h)))

	(define (f-modif x)
		(let ((factor (/ (- x a) (h))))
			(if (or (= factor 0) (= factor n))
					(f x)
					(if (even? factor)
							(* (f x) 2)
							(* (f x) 4)))
		))

	(* (sum f-modif a add-h b) (/ (h) 3.0)))
