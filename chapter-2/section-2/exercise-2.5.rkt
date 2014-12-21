#lang planet neil/sicp

(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

(define (car z)
  (define (iter n k)
    (if (not (= (remainder n 2) 0))
        k
        (iter (/ n 2) (+ k 1))))
  (iter z 0))

(define (cdr z)
  (define (iter n k)
    (if (not (= (remainder n 3) 0))
        k
        (iter (/ n 3) (+ k 1))))
  (iter z 0))

(define (pow a n)
  (if (= n 0)
      1
      (* a (pow a (- n 1)))))

;; Result:
;; racket@> (define z (cons 23 12))
;; racket@> (car z)
;; 23
;; racket@> (cdr z)
;; 12
