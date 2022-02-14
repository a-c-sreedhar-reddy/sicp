#lang racket

(define (encode-symbol symbol tree)
  (if (null? tree) (error "bad symbol" symbol)
      

(define (encode symbol tree)
  (if (leaf? tree)
      (if (eq? symbol (symbol-leaf tree))
          '()
          (error "symbol cannot be found"))
      (let ((left (left-branch tree)))
        (if (memq sym (symbols left))
            (cons 0 (encode symbol left))
            (cons 1 (encode symbol (right-branch tree)))))))