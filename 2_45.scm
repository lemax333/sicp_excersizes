(define (split main sub)
  (lambda (painter n)
    (if (= n 0)
	painter
	(let ((smaller ((split painter painter) painter (- n 1))))
	  (main painter (sub smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))
