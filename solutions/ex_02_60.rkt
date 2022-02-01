#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set x set)
  (append x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
  


(define s1 (list 2 3 2 1 3 2 2))
(define s2 (list 1 3 9 15))

(element-of-set? 2 s1)

(adjoin-set 4 s1)

(union-set s1 s2)

(intersection-set s1 s2)

;; element-of-set? and intersection-set would take more time than the previous represenation.
;; adjoin-set and union-set would take less time since we do not have to check the other list.
;; This representation would be useful for a use-case where there are multiple adjoin-set operations
;;   and less intersection-set operations.