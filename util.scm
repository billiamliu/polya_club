(define (string->int-list str)
  (map (lambda (char) (- (char->integer char) 48)) (string->list str)))

(define (int-list->int ll)
  (let ((str-list (map number->string ll)))
    (define (iter strs)
      (if (null? strs)
        ""
        (string-append (car strs) (iter (cdr strs)))))
    (string->number (iter str-list))))
