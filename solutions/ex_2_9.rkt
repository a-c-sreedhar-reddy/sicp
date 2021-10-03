#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


(define (width x)
  (/ (+ (lower-bound x) (upper-bound x)) 2.0))

;ADD WIDTH OF TWO INTERVALS
;(define (added-width x y)
;  (let ((added-interval (add-interval x y)))
;    (width added-interval)))

;The above function could be rewritten interms of width of two intervals. since
;(((lower-bound x) + (lower-bound y)) + ((lower-bound x) + (upper-bound y))) / 2
;=> ((lower-bound x) + (upper-bound x))/2 + ((lower-bound y)+(upper-bound y))/2
;=> (width x) + (width y)
(define (added-width x y)
 (+ (width x) (width y)))



;SUBTRACT WIDTH OF TWO INTERVALS
; (define (sub-width x y)
;   (width (sub-interval x y)))

;The above function could be rewritten interms of width of two intervals. since
;(((lower-bound x) - (upper-bound y)) + ((upper-bound x) - (lower-bound y))) / 2
;=> ((lower-bound x) + (upper-bound x))/2 - ((lower-bound y)+(upper-bound y))/2
;=> (width x) - (width y)
(define (sub-width x y)
  (- (width x) (width y)))

  
;Multiplication could not be expressed interms of widths 
; since we are not sure which term would be the minimum

