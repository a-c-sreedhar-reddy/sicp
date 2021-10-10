#lang racket
(define (even? x)
  (= (remainder x 2) 0))


(define (same-parity a . b)
  (if (even? a)
      (cons a (filter even? b))
      (cons a (filter (lambda (x) (not (even? x))) b))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
