#lang planet neil/sicp
(require (planet neil/sicp))
(define (reverse li)
  (if (null? li) '()
      (append (reverse (cdr li))
            (cons (car li) '()))))

