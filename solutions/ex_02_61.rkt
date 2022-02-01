#lang racket

(define (adjoin-set x s)
  (cond ((null? s) (list x))
        ((equal? (car s) x) s)
        ((> (car s) x) (cons x s))
        (else (cons (car s) (adjoin-set x (cdr s))))))


(define s (list  1 2 3 4 9 10))
(adjoin-set 6 s)