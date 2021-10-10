#lang racket

(define (deep-reverse-iter l last)
  (cond
    [(null? (cdr l)) (cons (if (pair? (car l))
                               (deep-reverse (car l))
                               (car l))
                           last)]
    [else (deep-reverse-iter
           (cdr l)
           (cons (if (pair? (car l))
                     (deep-reverse (car l))
                     (car l)) last))]))

(define (deep-reverse l)
  (deep-reverse-iter l null))


(define x (list (list 1 2) (list 3 4)))

x
(reverse x)
(deep-reverse x)
