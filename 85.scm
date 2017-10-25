(load "util.scm")

(define input
  (list
    (list 1 0 1 0 0)
    (list 1 0 1 1 1)
    (list 1 1 1 1 1)
    (list 1 0 0 1 0)))

(define (store-substitute msg)
  (lambda (row col)
    (newline)
    (display msg)
    (newline)
    (display row)
    (newline)
    (display col)))

(define (make-store)
  ; state vars
  (define current-max 0)
  (define memory '())

  (define (register row col)
    ;; CONTINUE HERE
    'ok)

  (define (show row col)
    (newline)
    (display "r")
    (display row)
    (display "c")
    (display col))

  (lambda (msg)
    (cond ((eq? msg 'register) register)
          ((eq? msg 'show) show)
          (else
            (error "Unknown message -- Store" msg)))))

(define (scan store row index)
  (define (iter remain col-idx)
    (cond ((null? remain) '())
          ((= 1 (car remain))
            ((store 'show) index col-idx)
            (iter (cdr remain) (+ 1 col-idx)))
          (else (iter (cdr remain) (+ 1 col-idx)))))
  (iter row 0)
  store)

(reduce-with-index scan (make-store) input)
