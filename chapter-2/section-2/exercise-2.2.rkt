#lang planet neil/sicp

(define (make-seg start end)
  (cons start end))

(define (start-seg seg)
  (car seg))

(define (end-seg seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point z)
  (car z))

(define (y-point z)
  (cdr z))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-seg seg)
  (let ((start (start-seg seg))
        (end (end-seg seg)))
    (make-point (/ (+ (average (x-point start)
                               (y-point end))
                      (average (x-point end)
                               (y-point start)))
                   2))))


