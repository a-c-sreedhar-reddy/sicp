
#lang racket 

(define (iterative-improve good? improve)
  (define (try guess)
    (if (good? guess) guess (try (improve guess))))
  (lambda (guess) (try guess)))


(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (define (good-enough? guess)(< (abs (- (square guess) x)) 0.001))
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve close-enough? f) first-guess))

;(fixed-point cos 1.0)
