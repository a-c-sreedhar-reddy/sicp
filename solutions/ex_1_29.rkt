#lang racket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integrate f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define innerSum (sum (lambda (k) (if (= (remainder k 2) 0) (* 2 (y k)) (* 4 (y k))))
                        1
                        (lambda (k) (+ 1 k))
                        (- n 1)))
  (* (/ h 3) (+ (y 0) innerSum (y n))))

(integrate (lambda (x) (* x x x)) 0 1 100)
(integrate (lambda (x) (* x x x)) 0 1 1000)
