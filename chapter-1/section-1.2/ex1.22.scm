(define (smallest-divisor n) 
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (display n)
  (newline)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (time-difference (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(use-modules (srfi srfi-19))

(define (runtime) (current-time))

(define (search-for-primes a b) 
  (cond ((= (remainder a 2) 0) (search-for-primes (+ a 1) b))
        (else
         (timed-prime-test a)
         (if (< (+ a 1) b) (search-for-primes (+ a 2) b)))))

          
          
      
