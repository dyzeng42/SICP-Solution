#lang planet neil/sicp

(define (same-parity first . rest)
  (let ((x (car rest)))
    (if (null? rest) '()
        (append (if (= (remainder first 2)
                       (remainder x 2))
                    (list x)
                    empty)
                (same-parity first (cdr rest))))))
