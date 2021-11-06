#lang racket

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 1 1)
                     (make-vect 0 0)))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))

(define (rotate180 painter)
  ((repeat rotate90 2) painter))

(define (rotate270 painter)
  ((repeat rotate90 3) painter))