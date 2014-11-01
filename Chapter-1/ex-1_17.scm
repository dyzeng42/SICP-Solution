#lang planet neil/sicp

;; exercise 1_17 : "Fast addition"

(define (mul a b)
  (define (double a) (+ a a))
  (define (halve a)  (/ a 2))
  (define (mul-iter ans base n)
    (if (= n 0) ans
        (if (even? n) 
            (mul-iter ans (double base) (halve n))
            (mul-iter (+ ans base) (double base) (halve (- n 1))))))
  (mul-iter 0 a b))