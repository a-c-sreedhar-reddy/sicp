#lang racket
(define (for-each callback l)
  (if (null? l)
      true
      (let ([a (callback (car l))]) (for-each callback (cdr l)))))


(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))