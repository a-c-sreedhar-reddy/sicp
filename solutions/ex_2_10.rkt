#lang racket

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (end-points-signs interval)
  (let ((left (lower-bound interval))
        (right (upper-bound interval)))
    (cond [(and (>= left 0) (>= right 0)) "positive"]
          [(and (< left 0) (>= right 0)) "negativepositive"]
          [else "negative"])))
        

(define (mul-interval x y)
  (let ((xendpoints (end-points-signs x))
        (yendpoints (end-points-signs y))
        (x-lower-bound (lower-bound x))
        (x-upper-bound (upper-bound x))
        (y-lower-bound (lower-bound y))
        (y-upper-bound (upper-bound y)))
    (cond [(and (= xendpoints "positive") (= yendpoints "positive")) (make-interval (* x-lower-bound y-lower-bound) (* x-upper-bound y-upper-bound))]
          [(and (= xendpoints "positive") (= yendpoints "negativepositive")) (make-interval (* x-upper-bound y-lower-bound) (* x-upper-bound y-upper-bound))]
          [(and (= xendpoints "positive") (= yendpoints "negative")) (make-interval (* x-upper-bound y-lower-bound) (* x-lower-bound y-upper-bound))]
          [(and (= xendpoints "negative") (= yendpoints "positve")) (make-interval (* x-lower-bound y-upper-bound) (* x-upper-bound y-lower-bound))]
          [(and (= xendpoints "negative") (= yendpoints "negativepositive")) (make-interval (* x-lower-bound y-upper-bound) (* x-lower-bound y-lower-bound))]
          [(and (= xendpoints "negative") (= yendpoints "negative")) (make-interval (* x-upper-bound y-upper-bound) (* x-lower-bound y-lower-bound))]
          [(and (= xendpoints "negativepositive") (= yendpoints "positive")) (make-interval (* x-lower-bound y-upper-bound) (* x-upper-bound y-upper-bound))]
          [(and (= xendpoints "negativepositive") (= yendpoints "negativepositive")) (make-interval (min (* x-lower-bound y-upper-bound)
                                                                                                          (* x-upper-bound y-lower-bound))
                                                                                                     (max (* x-upper-bound y-upper-bound)
                                                                                                          (* x-lower-bound y-lower-bound)))]
          [(and (= xendpoints "negativepositive") (= yendpoints "negative")) (make-interval (* x-upper-bound y-lower-bound) (* x-lower-bound y-lower-bound))])))

