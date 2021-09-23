
#lang racket

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f (compose f (repeated f (- n 1)))))

(define n 13)
(define (average-damp x)
  (/ (+ x (/ (expt 2 n) (expt x (- n 1)))) 2.0))

(fixed-point (repeated average-damp 8) 1)

; TODO : confirm this answer
;1,1,1,2,2,1,1,1,1,1,1,1,1,8
