
#lang racket 

(define (tan-cf x k)
  (define (n i) (if (= i 1) x (* x x)))
  (define (d i) (- (* 2 i) 1))
  (define (get i)
    (if (= i k)
        (/ (n i) (d k))
        (/ (n i) (- (d i) (get (+ i 1))))))
  (get 1))

