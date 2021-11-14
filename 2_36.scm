(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      init
      (cons (accumulate op init
			(map car seqs))
	    (accumulate-n op init
			  (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(newline)
(display (accumulate-n + 0 s))
;;((1 2 3) (4 5 6) (7 8 9) (10 11 12)) -> (22 26 30)
