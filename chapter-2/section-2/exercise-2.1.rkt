#lang planet neil/sicp

(define (make-rat a b)
  (if (or (and (> a 0) (> b 0))
          (and (< a 0) (< b 0)))
      (cons (abs a) (abs b))
      (cons (- (abs a)) (abs b))))

(define (numer z)
  (car z))

(define (denom z)
  (cdr z))

;; Result =>
;; racket@> (make-rat 2 -3)
;; '(-2 . 3)
;; racket@> (make-rat -2 -3)
;; '(2 . 3)
;; racket@> (make-rat -2 3)
;; '(-2 . 3)
;; racket@> (make-rat 2 3)
;; '(2 . 3)
