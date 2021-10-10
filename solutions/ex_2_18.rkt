#lang racket

(define (reverse l last)
  (if (null? (cdr l))
      (cons (car l) last)
      (reverse (cdr l) (cons (car l) last))))


(reverse (list 1 4 9 16 25) null)
