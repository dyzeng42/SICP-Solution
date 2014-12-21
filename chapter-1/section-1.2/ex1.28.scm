(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square-sp (expmod base (/ exp 2) m) m)
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

;; if there is such a number x that satisfy such condition:
;; x != 1
;; x != n-1
;; square(x) % n == 1
;; then n can't be a prime number.
(define (square-sp x n)
  (if (and (and (> x 1) (< x (- n 1)))
           (= (remainder (* x x) n) 1))
      0
      (* x x)))

(define (miller-rabin-test n)
  (= 1 (expmod (+ 1 (random (- n 1))) (- n 1) n)))

(define (try-it n counter)
  (cond ((= counter 0) #t)
        ((miller-rabin-test n)
         (try-it n (- counter 1)))
        (else #f)))

(define (fast-prime? n)
  (try-it n 5))

(define (prime-algo-check n cnt algo)
  "Test whether the prime-check algorithm is correct, when n = 50000,
the value returned should be 5133"
  (cond ((= n 1) cnt)
        ((algo n) (prime-algo-check (- n 1) (+ cnt 1) algo))
        (else (prime-algo-check (- n 1) cnt algo))))
