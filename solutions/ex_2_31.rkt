#lang racket

(define (tree-map function tree)
  (map (lambda (x)
         (cond ((pair? x) (tree-map function x))
               (else (function x))))
       tree))

(define (square x) (* x x))

(define (square-tree-map tree) (tree-map square tree))
        

(square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
