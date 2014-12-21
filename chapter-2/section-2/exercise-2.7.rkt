#lang planet neil/sicp

(define (make-interval lower upper)
  (cons lower upper))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ly (lower-bound y))
        (ux (upper-bound x))
        (uy (upper-bound y)))
    (cond ((< ux 0)
           (cond ((< uy 0) (make-interval (* ux uy) (* lx ly)))
                 ((> ly 0) (make-interval (* lx uy) (* ux ly)))
                 (else (make-interval (* lx uy) (* lx ly)))))
          ((> lx 0)
           (cond ((< uy 0) (make-interval (* ly ux) (* uy lx)))
                 ((> ly 0) (make-interval (* lx ly) (* ux uy)))
                 (else (make-interval (* ux ly) (* ux uy)))))
          (else
           (cond ((< uy 0) (make-interval (* ly ux) (* ly lx)))
                 ((> ly 0) (make-interval (* uy lx) (* uy ux)))
                 (else (make-interval (min (* lx uy) (* ux ly))
                                      (max (* lx ly) (* ux uy)))))))))

(define (width-interval x)
  (- (upper-bound x) (lower-bound x)))
