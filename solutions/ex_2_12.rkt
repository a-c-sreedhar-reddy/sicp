#lang racket

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (make-center-percent c p)
  (let ((w (/ (* c p) 100.0)))
        (make-interval (- c w) (+ c w))))

(define (center i)
   (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent interval)
  (let ((w (/ (- (upper-bound interval) (lower-bound interval)) 2)))
        (/ (* w 100) (center interval))))
