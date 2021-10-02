#lang racket

(define (make-rat x y)
  
  (define (same-sign? a b)
    (or (and (>= a 0) (>= b 0)) (and (<= a 0) (<= b 0))))
  
  (define (gcd a b)
    (if (> a b)
        (gcd b a)
        (if (= (remainder b a) 0)
            a
            (gcd (remainder b a) a))))
  
  (let ([xygcd (gcd (abs x) (abs y))]
        [absx (abs x)]
        [absy (abs y)])
    (cond [(same-sign? x y) (cons (/ absx xygcd) (/ absy xygcd))]
          [else (cons (* -1 (/ absx xygcd)) (/ absy xygcd))])))

(define (numerator x) (car x))

(define (denominator x) (cdr x))
