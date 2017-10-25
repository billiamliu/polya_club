(load "table.scm")

(define input-0 (list '(MUC LHR) '(JFK MUC) '(SFO SJC) '(LHR SFO)))
(define spec-0 '(JFK MUC LHR SFO SJC))

(define input-1 (list '(JFK SFO) '(JFK ATL) '(SFO ATL) '(ATL JFK) '(ATL SFO)))
(define spec-1 '(JFK ATL JFK SFO ATL SFO))

(define table (make-table))

(define (try itn)
  (store itn)
  (define (iter airport journey)
    (let ((dest (pop airport)))
      (if dest
        (cons (iter dest) journey)
        (cons airport journey))))
  (iter 'JFK '()))

(define (store itn)
  (for-each (lambda (lst)
         (set (car lst) (cadr lst) table))
       itn)
  'ok)

(define (last-item lst)
  (if (null? lst)
    '()
    (if (null? (cdr lst))
      (car lst)
      (last-item (cdr lst)))))

(define (all-but-last lst)
  (if (null? lst)
    '()
    (if (null? (cdr lst))
      '()
      (cons (car lst) (all-but-last (cdr lst))))))

(define (pop keys)
  (let ((val (lookup keys table)))
    (if (and val (not (null? val)))
      (begin
        (set keys (all-but-last val) table)
        (last-item val))
      #f)))

(store input-0)
table
