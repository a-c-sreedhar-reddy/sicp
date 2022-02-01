#lang racket

;;a) they prooduce same results.
;;   (list 1 2 3 4 5 6 7)
;;
;;b) No they do not have the same order of growth.
;;   in the recursive case at each step we append two lists.
;;   where as with iterative case we add an element to the list.
;;   so the iterative process grows more slowly