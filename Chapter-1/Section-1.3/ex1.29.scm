;; Simpson's Rule

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x 1))
  (define (g k)
    (cond ((= k 0) (f a))
          ((= k n) (f b))
          ((even? k) (* 2 (f (+ a (* k h)))))
          (else      (* 4 (f (+ a (* k h)))))))
  (* (sum g 0 next n) (/ h 3)))
  

(define (cube x) (* x x x))

(simpson cube 0.0 1.0 100) ;=> 0.24999999999999992
(simpson cube 0.0 1.0 1000);=> 0.2500000000000003
