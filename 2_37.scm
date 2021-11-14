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


(define (dot-product v w) 
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n
   cons '() mat))

;; (define (matrix-*-matrix m n)
;;   (let ((cols (transpose n)))
;;     (map
;;      ⟨ ?? ⟩ m)))


(define mtx (list (list 1 1 1) (list 2 2 2) (list 3 3 3)))
(define mtx2 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define vec (list 5 7 13))
(define vec2 (list 1 1 1))
(newline)
(display
 (dot-product vec vec2))
(newline)
(display
 (matrix-*-vector mtx vec))
(newline)
(display
 (transpose mtx2))
