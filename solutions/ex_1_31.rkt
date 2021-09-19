#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))

(factorial 5)

(define n 6)

(define (inc x) (+ x 1))

(define (isEven x) (= (remainder x 2) 0))

(define pibyfour
  (/ (product (lambda (x)
                (if (isEven x)
                    (* (+ (/ x 2) 1) 2)
                    (* (+ (/ (- x 1) 2) 1) 2)))
              1
              inc
              n)
     (product (lambda (x) (if (isEven x)
                              (+ (* (/ x 2) 2) 1)
                              (+ (* (/ (+ 1 x) 2) 2) 1)))
              1
              inc
              n)))
pibyfour


(define (product_iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
