; ok
(define (string->int-list str)
  (map (lambda (char) (- (char->integer char) 48)) (string->list str)))

; ok
(define (int-list->int ll)
  (let ((str-list (map number->string ll)))
    (define (iter strs)
      (if (null? strs)
        ""
        (string-append (car strs) (iter (cdr strs)))))
    (string->number (iter str-list))))

; ok
(define (take-up-to n ints)
  (define (iter n ints current)
    (if (or (null? ints) (= n 0))
      current
      (iter (- n 1) (cdr ints) (append current (list (car ints))))))
  (iter n ints '()))

; ok
(define (drop-up-to n remain)
  (if (or (null? remain) (= n 0))
    remain
    (drop-up-to (- n 1) (cdr remain))))
