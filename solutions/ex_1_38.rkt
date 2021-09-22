
#lang racket 

(define (cont-frac n d k)
  (define (get i)
    (if (= i k)
        (/ (n i) (d k))
        (/ (n i) (+ (d i) (get (+ i 1))))))
  (get 1))

(define (euler-expansion k)
  (cont-frac (lambda (x) 1.0)
             (lambda (x) (cond [(= x 1) 1]
                               [(= x 2) 2]
                               [(= (remainder x 3) 0) 1]
                               [(= (remainder (- x 1) 3) 0) 1]
                               [else (* 2 (+ (quotient x 3) 1))]))
             k))
