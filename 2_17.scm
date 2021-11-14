(define (last-pair l)
  (list (list-ref l (- (length l) 1))))

(display (last-pair (list 23 72 149 34)))
