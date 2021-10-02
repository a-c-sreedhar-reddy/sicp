
#lang racket

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (ownlog x base)
  (cond [(= x 1) 0]
        [else (+ 1 (ownlog (/ x base) base))]))


(define (car x)
  (cond [(= (remainder x 3) 0) (car (/ x 3))]
        [else (ownlog x 2)]))

(define (cdr x)
  (cond [(= (remainder x 2) 0) (cdr (/ x 2))]
        [else (ownlog x 3)]))

