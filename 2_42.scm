(define (enumerate-interval initial n)
  (define (iter x)
    (if (> x n)
	'()
	(cons x (iter (+ x 1)))))
  (iter initial))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (reverse sequence)
  (accumulate (lambda (x y)
		(append y (list x))) '() sequence))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (position row column) (list (list row column)))

(define (position-row pos)
  (car pos))

(define (position-column pos)
  (cadr pos))

(define empty-board  '())

(define (adjoin-position row column ways)
  (append ways (position row column)))

(define (safe? column positions)
  (define (in-diagonal? p1 p2)
    (= (- (position-column p2) (position-column p1))
       (abs (- (position-row p1) (position-row p2)))))

  (define (safe-pos? pos positions)
    (or (null? positions)
	(= 0 (length (filter (lambda (x)
			       (or
				(= (position-row x) (position-row pos))
				(in-diagonal? x pos))) positions)))))

  (safe-pos? (car (filter (lambda (x) (= (position-column x) column)) positions))
	     (filter (lambda (x) (not (= (position-column x) column))) positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions)
	   (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position
		    new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
