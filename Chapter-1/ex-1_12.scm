#lang planet neil/sicp

;; exercise 1.12 : Compute Pascal's Triangle

(define (pascal i j)
  (cond ((= j 1) 1)
        ((> j i) 0)
        (else (+ (pascal (- i 1) (- j 1)) (pascal (- i 1) j)))))