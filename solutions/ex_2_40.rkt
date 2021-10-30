#lang racket


(define (unique-pairs n)
  (foldl append null (map (lambda (x)
         (map (lambda (y)
                (list x y))
              (inclusive-range 1 (- x 1))))
       (inclusive-range 2 n))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime? x)
  (define (divisors x a b)
    (if (> a b)
        false
        (cond [(= (remainder x a) 0) true] [else (divisors x (+ a 1) b)])))
  (cond [(= x 1) true]
        [else (not (divisors x 2 (- x 1)))]))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))


(prime-sum-pairs 6)
