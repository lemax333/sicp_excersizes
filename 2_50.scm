(define (flip-horiz painter)
  (lambda (frame)
    ((transform-painter
     painter
     (make-vect 1.0 0.0)
     (make-vect 0.0 0.0)
     (make-vect 1.0 1.0)) frame)))

(define (rotate-180 painter)
  (lambda (frame)
    ((transform-painter
     painter
     (make-vect 1.0 1.0)
     (make-vect 0.0 1.0)
     (make-vect 1.0 0.0)) frame)))

  
(define (rotate-270 painter) 
  (transform-painter painter 
		     (make-vect 0.0 1.0) 
		     (make-vect 0.0 0.0) 
		     (make-vect 1.0 1.0))) 
