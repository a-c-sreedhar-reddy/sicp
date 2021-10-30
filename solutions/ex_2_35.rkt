#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (p)
                         (cond ((null? p) 0)
                               ((pair? p) (count-leaves p))
                               (else 1)))
                       t)))
