(define (product term a next b)
  (if (a > b) 1
      (* (term a) (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b) retult
        (iter (next a) (* result (term a)))))
  (iter a 1.0))
