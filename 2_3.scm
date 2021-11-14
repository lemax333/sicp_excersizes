(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment s_point e_point) (cons s_point e_point))
(define (start-segment line) (car line))
(define (end-segment line) (cdr line))

;;representation 1
(define (make-rect top-left bottom-right)
  (cons top-left bottom-right))

(define (top-left rect) (car rect))
(define (top-right rect)
  (make-point (x-point (cdr rect))
	      (y-point (car rect))))
(define (bottom-left rect)
  (make-point (x-point (car rect))
	      (y-point (cdr rect))))
(define (bottom-right rect) (cdr rect))

(define (width-rect rect)
  (abs (- (x-point (top-left rect)) (x-point (top-right rect)))))

(define (height-rect rect)
  (abs (- (y-point (top-left rect)) (y-point (bottom-left rect)))))

(define (perimeter rect)
  (* 2 (+ (height-rect rect) (width-rect rect))))

(define (area rect)
  (* (height-rect rect) (width-rect rect)))


;; Usage: 
(define r (make-rect (make-point 1 1) 
                      (make-point 3 7)))

(newline)
(display "representation 1")
(print-point (top-left r)) (print-point (bottom-right r))
(newline)
(display (width-rect r))
(newline)
(display (height-rect r))
(newline)
(display (area r))
(newline)
(display (perimeter r))

;;representation 2
(define (make-rect top-left width height)
  (cons top-left (cons width height)))

(define (width-rect rect)
  (car (cdr rect)))

(define (height-rect rect)
  (cdr (cdr rect)))

(define (top-left rect) (car rect))
(define (top-right rect)
  (make-point (+ (x-point (car rect)) (width-rect rect))
	      (y-point (car rect))))
(define (bottom-left rect)
  (make-point (x-point (car rect))
	      (+ (y-point (car rect)) (height-rect rect))))
(define (bottom-right rect)
  (make-point (+ (x-point (car rect)) (width-rect rect))
	      (+ (y-point (car rect)) (height-rect rect))))

(define (perimeter rect)
  (* 2 (+ (height-rect rect) (width-rect rect))))

(define (area rect)
  (* (height-rect rect) (width-rect rect)))


(define r (make-rect (make-point 1 1) 2 6))

(newline)
(display "representation 2")
(print-point (top-left r)) (print-point (bottom-right r))
(newline)
(display (width-rect r))
(newline)
(display (height-rect r))
(newline)
(display (area r))
(newline)
(display (perimeter r))
