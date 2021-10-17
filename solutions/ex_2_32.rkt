#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define a (list 1 2 3))
(subsets a)

;We first calculate all the subsets excluding the first element in the list
;Now we calculate all the subsets which would include the first element
;We do that by appending the first element to all the possible subsets without the first element
;We combine these two subset lists.