;;excersizes 2.7 - 2.16
(define (make-interval a b) (cons a b))
(define (upper-bound x)(cdr x))
(define (lower-bound x)(car x))
(define (width x) (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
		 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
(let ((p1 (* (lower-bound x) (lower-bound y)))
      (p2 (* (lower-bound x) (upper-bound y)))
      (p3 (* (upper-bound x) (lower-bound y)))
      (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
		 (max p1 p2 p3 p4))))

(define (print-interval i)
  (newline)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "], ")
  (display "center:")
  (display (center i))
  (newline))

;; excersize 2.11
(define (pos? x) (< 0 x)) 
(define (neg? x) (> 0 x)) 

(define (mul-interval x y) 
  (let ((x1 (lower-bound x)) 
	(x2 (upper-bound x)) 
	(y1 (lower-bound y)) 
	(y2 (upper-bound y))) 
    (cond ((and (pos? x1) (pos? y1)) 
	   (make-interval (* x1 y1) (* x2 y2))) 
	  ((and (pos? x2) (pos? y1)) 
	   (make-interval (* x1 y2) (* x2 y2))) 
	  ((and (pos? x1) (pos? y2)) 
	   (make-interval (* x2 y1) (* x2 y2))) 
	  ((and (neg? x2) (pos? y2)) 
	   (make-interval (* x1 y2) (* x2 y1))) 
	  ((and (pos? x2) (neg? y2)) 
	   (make-interval (* x1 y2) (* x2 y1))) 
	  ((and (neg? x2) (neg? y2)) 
	   (make-interval (* x1 y1) (* x2 y2))) 
	  ((and (pos? x2) (pos? y2)) 
	   (let ((i1 (* x1 y1)) 
		 (i2 (* x1 y2)) 
		 (i3 (* x2 y1)) 
		 (i4 (* x2 y2))) 
	     (make-interval (min i1 i2 i3 i4) 
			    (max i1 i2 i3 i4))))))) 

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (display "Error: division by zero")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
		      (/ 1.0 (lower-bound y))))))



;;test for ex. 2.9
(newline)
(display (width (add-interval (make-interval 1 100) (make-interval 200 955))))
(newline)
(display (+ (width (make-interval 1 100)) (width (make-interval 200 955))))

(newline)
(display (width (mul-interval (make-interval 1 100) (make-interval 200 955))))
(newline)
(display (* (width (make-interval 1 100)) (width (make-interval 200 955))))

;;test for ex. 2.10
(newline)
(div-interval (make-interval 1 4) (make-interval -1 1))


;;ex. 2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
(define (percent i)
  (/ (* (width i) 100) (center i)))

(define i (make-center-percent 10 50))
(newline)
(display (lower-bound i))
(newline)
(display (upper-bound i))
(newline)
(display (center i))
(newline)
(display (percent i))
(newline)

;;ex. 2.13 - Notebook 2020 - page - 24 January
;;ex. 2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
		       (div-interval one r2)))))

;; ex. 2.14-2.16
(print-interval i)
(print-interval (div-interval i i))
;; in interval arithmetic there is no identity or inverse
