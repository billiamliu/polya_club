(load "util.scm")
(define input-str "25525511135")
(define input (string->int-list input-str))
input

;; input int list e.g. '(1 2 3)
(define (is-valid-block? ints)
  (let ((block (int-list->int ints)))
    (and (>= block 0) (<= block 255))))

(define (try input)
  (define (iter ints size)
          ; null check
    (cond ((null? ints) '())
          ; null check
          ((= 0 size) '())
          ; start with 0 check
          ((= 0 (car ints))
           (cons '(0) (iter (cdr ints) size)))
          ; main check
          ((is-valid-block? (take-up-to size ints))
           (list
             (take-up-to size ints)
             (iter (drop-up-to size ints) 3)
             (iter (drop-up-to size ints) 3)
             (iter (drop-up-to size ints) 3)))
          (else (iter ints (- size 1)))))
  (iter input 3))

(define input-0 '(9 8 7 6 5 4 3 2 1 9 9 9))
(define input-1 '(1 9 2 1 6 8 0 1))
(define input-2 '(0 0 0 0))
(define input-3 '(2 5 5 2 5 5 2 5 5 2 5 5))
(define input-4 '(2 5 5 2 5 5 1 1 1 3 5))
(define input-5 '(2 5 6 5 0 1 1 1))

;(try input)
;(try input-0)
;(try input-1)
;(try input-2)
;(try input-3)
;(try input-4)
(try input-5)
