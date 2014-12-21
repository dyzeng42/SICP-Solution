#lang planet neil/sicp

(define (last-pair l)
  (define (iter li n)
    (if (<= n 1)
        (car (list li))
        (iter (cdr li) (- n 1))))
  (iter l (length l)))
