(define input-0 '(1 1 7 7 1 1))
(define input-1 '(1 5 1 1 5 1))
(define input-2 '(3 2 1))
(define input-3 '(1 2 3))
(define input-4 '(1 5 1 5))
(define input-4 '(1 6 7 9 5 6 1 4 1 2 4 1 2 4 5 1 5 1 1 1 1 1 1))

(define (try input)
  (let ((j-coord (- (length input) 1)))
    (define (iter largest-i largest-j largest-area i j)
      (let* ((width (- j i))
             (min-h (min (list-ref input i) (list-ref input j)))
             (area (* width min-h))
             (larger? (> area largest-area)))
        (if (<= (- j i) 1)
          (if larger?
            (list 'i i 'j j 'area area)
            (list 'i largest-i 'j largest-j 'area largest-area))
          (iter
            (if larger? i largest-i)
            (if larger? j largest-j)
            (if larger? area largest-area)
            (if (<= (list-ref input i) min-h) (+ i 1) i)
            (if (<= (list-ref input j) min-h) (- j 1) j)))))
    (iter 0 j-coord 0 0 j-coord)))

(try input-0)
(try input-1)
(try input-2)
(try input-3)
(try input-4)
