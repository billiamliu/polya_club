(define (string->int-list str)
  (map (lambda (char) (- (char->integer char) 48)) (string->list str)))

(define (int-list->int ll)
  (let ((str-list (map number->string ll)))
    (define (iter strs)
      (if (null? strs)
        ""
        (string-append (car strs) (iter (cdr strs)))))
    (string->number (iter str-list))))

(define (take-up-to n ints)
  (define (iter n ints current)
    (if (or (null? ints) (= n 0))
      current
      (iter (- n 1) (cdr ints) (append current (list (car ints))))))
  (iter n ints '()))

(define (drop-up-to n remain)
  (if (or (null? remain) (= n 0))
    remain
    (drop-up-to (- n 1) (cdr remain))))

(define (reduce-with-index proc mem input)
  (define (iter fn m in idx)
    (if (null? in)
      m
      (iter fn (fn m (car in) idx) (cdr in) (+ 1 idx))))
  (iter proc mem input 0))

(define (foldr proc init seq)
  (if (null? seq)
    init
    (proc (car seq)
          (foldr proc init (cdr seq)))))

(define (flatmap proc seq)
  (foldr append '() (map proc seq)))

(define (permutations s)
  (if (null? s)
    '(())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove-item x s))))
             s)))

(define (remove-item item seq)
  (filter (lambda (x) (not (= x item))) seq))
