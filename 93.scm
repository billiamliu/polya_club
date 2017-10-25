(load "util.scm")
(define input-str "25525511135")
(define input (string->int-list input-str))
input

;; input int list e.g. '(1 2 3)
(define (is-valid-block? ints)
  (let ((block (int-list->int ints)))
    (and (>= block 0) (<= block 255))))

(define (try input)
  (define (iter ints size blocks valid?)
          ; null check
    (cond ((not valid?) #f)
          ((= 0 size) '())

          ; rule check
          ((and (null? ints) (= blocks 4)) #t)
          ((and (not (null? ints)) (= blocks 4)) #f)

          ; size check
          ((< (length ints) size) #f)

          ; start with 0 check
          ((= 0 (car ints))
           (list '(0)
                 (iter (cdr ints) 3 (+ blocks 1) valid?)
                 (iter (cdr ints) 2 (+ blocks 1) valid?)
                 (iter (cdr ints) 1 (+ blocks 1) valid?)))

          ; main check
          ((is-valid-block? (take ints size))
           (list
             (take ints size)
             (list
               (iter (drop ints size) 3 (+ blocks 1) valid?)
               (iter (drop ints size) 2 (+ blocks 1) valid?)
               (iter (drop ints size) 1 (+ blocks 1) valid?))))

          (else #f)))
  (list
    (iter input 3 0 #t)
    (iter input 2 0 #t)
    (iter input 1 0 #t)))

(try input)

