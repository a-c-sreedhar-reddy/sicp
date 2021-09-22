
#lang racket 

(define (cont-frac n d k)
  (define (get i)
    (if (= i k)
        (/ (n i) (d k))
        (/ (n i) (+ (d i) (get (+ i 1))))))
  (get 1))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 11)

;We have to make k 11 in order to get an approximate upto four decimals.

;b) iterative process
(define (cont-frac-iter n d k)
  (define (get calculate i)
    (if (= i k)
        (calculate (/ (n i) (d k)))
        (get (lambda (x) (calculate (/ (n i) (+ (d i) x)))) (+ i 1))))
  (get (lambda (x) x) 1))

(cont-frac-iter (lambda (x) 1.0) (lambda (x) 1.0) 11)
