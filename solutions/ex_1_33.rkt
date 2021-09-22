#lang racket

(define (prime? x)
  (define (divisors x a b)
    (if (> a b)
        false
        (cond [(= (remainder x a) 0) true] [else (divisors x (+ a 1) b)])))
  (cond [(= x 1) true]
        [else (not (divisors x 2 (- x 1)))]))

(define (gcd a b)
  (if (> a b)
      (gcd b a)
      (if (= (remainder b a) 0)
          a
          (gcd (remainder b a) a))))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b filter))
          (filtered-accumulate combiner null-value term (next a) next b filter))))

;a
(define (sum-of-squares-of-prime-number a b)
  (filtered-accumulate + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime?))

;b
(define (product-of-relative-primes n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) (- n 1) (lambda (x) (= (gcd x n) 1))))



      
