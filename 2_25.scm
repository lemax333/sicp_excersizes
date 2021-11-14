;;car and cdr for each list to get 7

;;(1 3 (5 7) 9)
(define a (list 1 3 (list 5 7) 9))
(newline)
(display (car (cdaddr a)))


;;((7))
(define b (list (list 7)))
(newline)
(display (caar b))

;;(1 (2 (3 (4 (5 (6 7))))))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(newline)
(display (car (cdr (car (cdr (car (cdr (car (cdr (cadadr c))))))))))
