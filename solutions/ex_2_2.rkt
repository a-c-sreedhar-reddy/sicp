#lang racket
; Point module
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Segment module
(define (make-segment x y) (cons x y))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (average x y) (/ (+ x y) 2))
(define (mid-point-segment s)
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))


(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define s (make-segment p1 p2))
(print-point (mid-point-segment s))