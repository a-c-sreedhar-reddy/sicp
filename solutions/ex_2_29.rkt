#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))


;b)
(define (total-weight mobile)
 (+ (branch-weight (left-branch mobile))
    (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
        (total-weight structure)
        (car (cdr branch)))))


;c)
(define (balanced? mobile)
  (and (balanced-branch? (left-branch mobile))
       (balanced-branch? (right-branch mobile))
       (= (* (branch-length (left-branch mobile))
             (branch-weight (left-branch mobile)))
          (* (branch-length (right-branch mobile))
             (branch-weight (right-branch mobile))))))

(define (balanced-branch? branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
        (balanced? structure)
        true)))

;d)
; If we change the representation then line (car (cdr branch)) to calculate weight of the branch has to be changed according to the above program.