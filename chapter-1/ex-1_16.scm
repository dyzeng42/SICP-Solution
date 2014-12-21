#lang planet neil/sicp

;; exercise 1_16 : Interative fast-expt

(define (fast-expt b n) 
  (define (expt-iter ans base n)
    (if (= n 0) ans
        (if (even? n) 
            (expt-iter ans (* base base) (/ n 2))
            (expt-iter (* ans base) (* base base) (/ (- n 1) 2)))))
      (expt-iter 1 b n))
            
(fast-expt 2 0)
        
  