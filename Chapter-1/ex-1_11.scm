#lang planet neil/sicp

;; exersice 1.11 : Compute f(n) = f(n-1) + 2*f(n-2) + 3*f(n-3)

;; recursion version
(define (f-rec n)
  (define (f n)
    (if (< n 3) n
        (+ (f (- n 1)) 
           (* 2 (f (- n 2))) 
           (* 3 (f (- n 3))))))
  (f n))

;; iterative version
(define (f-it n)
  (define (f a b c count)
    (if (= count 0) a
        (f b c (+ (* a 3) (* b 2) c) (- count 1))))
  (f 0 1 2 n))
    