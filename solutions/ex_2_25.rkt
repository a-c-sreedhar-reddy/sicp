#lang racket

(define one (list 1 3 (list 5 7) 9))
one
(car (cdr (car (cdr (cdr one)))))

(define two (list (list 7)))
two
(car (car two))

(define three (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
three
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr three))))))))))))