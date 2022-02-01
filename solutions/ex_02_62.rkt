#lang racket

(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((null? s2) s1)
        ((equal? (car s1) (car s2)) (cons (car s1)
                                          (union-set (cdr s1)
                                                     (cdr s2))))
        ((< (car s1) (car s2)) (cons (car s1)
                                     (union-set (cdr s1) s2)))
        (else (cons (car s2) (union-set s1 (cdr s2))))))


(define s1 (list 1  2 3 4 5))
(define s2 (list   1 4 8 10))
(union-set s1 s2)