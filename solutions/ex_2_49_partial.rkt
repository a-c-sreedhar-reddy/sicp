#lang racket


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (car (cdr frame)))
(define (edge2-frame frame) (car (cdr (cdr frame))))


(define (make-vect x y) (cons x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (mid-vect v1 v2)
  (scale-vect 0.5 (sub-vect v1 v2)))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))



(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define (outline frame)
  (segments->painter
   (list
    (segment (origin-frame frame) (edge1-frame frame))
    (segment (edge1-frame frame) (add-vect (edge1-frame frame) (edge2-frame frame)))
    (segment (add-vect (edge1-frame frame) (edge2-frame frame)) (edge2-frame frame))
    (segment (edge2-frame frame) (origin-frame frame)))))

(define (drawx frame)
  (segments->painter
   (list
    (segment (origin-frame frame) (add-vect (edge1-frame frame) (edge2-frame frame)))
    (segment (edge1-frame frame) (edge2-frame frame)))))

(define (diamond frame)
  (segments->painter
   (list
    (segment (mid-point (origin-frame frame) (edge1-frame frame))
             (mid-point (edge1-frame frame) (add-vect (edge1-frame frame) (edge2-frame frame))))
    (segment (mid-point (edge1-frame frame) (add-vect (edge1-frame frame) (edge2-frame frame)))
             (mid-point (add-vect (edge1-frame frame) (edge2-frame frame)) (edge2-frame frame)))
    (segment (mid-point (add-vect (edge1-frame frame) (edge2-frame frame)) (edge2-frame frame))
             (mid-point (origin-frame frame) (edge2-frame frame)))
    (segment (mid-point (origin-frame frame) (edge2-frame frame))
             (mid-point (origin-frame frame) (edge1-frame frame))))))

; How can we write a wave procedure
              
    