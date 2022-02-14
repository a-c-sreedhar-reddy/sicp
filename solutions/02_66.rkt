#lang racket

(define (look-up given-key set-of-records)
  (cond ((null? set-of-records) False)
        ((equal? given-key (key (root set-of-records))) (root set-of-records))
        ((< given-key (key (root set-of-records))) (left-sub-tree set-of-records))
        ((> given-key (key (root set-of-records))) (right-sub-tree set-of-records))))