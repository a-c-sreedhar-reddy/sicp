#lang racket
; Point module
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; implementation 1
(define (make-rect bottom-left top-right)
  (cons bottom-left top-right))

(define (width rect)
  (abs (- (x-point (car rect)) (x-point (cdr rect)))))

(define (height rect)
  (abs (- (y-point (car rect)) (y-point (cdr rect)))))

;implementation 2
(define (make-rect top-left height width)
  (cons top-left (cons height width)))

(define (width rect)
  (cdr (cdr rect)))

(define (height rect)
  (car (cdr rect)))

;perimeter and area procedures
(define (perimeter rect)
  (* 2 (+ (width rect) (height rect))))

(define (area rect)
  (* (width rect) (height rect)))



