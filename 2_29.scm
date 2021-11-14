(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-struct branch)
  (car (cdr branch)))

;; (define (total-weight mobile)
;;   (if (pair? (left-branch mobile))
;;       (if (pair? (right-branch mobile))
;; 	  (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile)))
;; 	  (+ (total-weight (left-branch mobile)) (right-branch mobile)))
;;       (if (pair? (right-branch mobile))
;; 	  (total-weight (right-branch mobile))
;; 	  (right-branch mobile))))

;; (define (total-weight mobile)
;;   (let ((l-branch (left-branch mobile))
;; 	(r-branch (right-branch mobile)))
;;     (if (pair? l-branch)
;;       (if (pair? r-branch)
;; 	  (+ (total-weight l-branch) (total-weight r-branch))
;; 	  (+ (total-weight l-branch) r-branch))
;;       (if (pair? r-branch)
;; 	  (total-weight r-branch)
;; 	  r-branch))))


(define (branch-weight b)
  (total-weight (branch-struct b)))

(define (total-weight mobile)
  (newline)
  (display "total-weight ") (display mobile) (newline)
  (if (pair? mobile)
      (+ (branch-weight (left-branch mobile))
	 (branch-weight (right-branch mobile)))
      mobile))


(define x (make-mobile (make-branch 1 1) (make-branch 1
						      (make-mobile (make-branch 1 1) (make-branch 1
												  (make-mobile (make-branch 1 1) (make-branch 1 1)))))))

(define xx (make-mobile (make-branch 1 2) (make-branch 1 5)))

(define xxx (make-mobile (make-branch 1 (make-mobile (make-branch 1 1) (make-branch 3 2)))
			 (make-branch 1 (make-mobile (make-branch 1 3) (make-branch 3 4)))))

(newline)
(display (total-weight x))
(newline)
(display (total-weight xx))
(newline)
(display (total-weight xxx))


(define (torque branch)
  (* (branch-length branch) (branch-weight branch)))

(define (balanced-branch? branch)
  ;; (newline)
  ;; (display "balanced? ") (display branch)
  (if (pair? (branch-struct branch))
      (balanced? (branch-struct branch))
      #t))

(define (balanced? mobile)
  (newline)
  (display "balanced? ") (display mobile)
  (and (= (torque (right-branch mobile)) (torque (left-branch mobile)))
       (and (balanced-branch? (right-branch mobile)) (balanced-branch? (left-branch mobile)))))

(define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8))))) 
(define m2 (make-mobile 
             (make-branch 4 6) 
             (make-branch 2 
                          (make-mobile 
                           (make-branch 5 8) 
                           (make-branch 10 4)))))
