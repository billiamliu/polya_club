(define (make-table) (list '*table*))

(define (is-table? table)
  (if (pair? (car table))
    #f
    #t))

(define (lookup keys table)
  (let ((subtable (assoc (car keys) (cdr table))))
    (cond ((not subtable) #f)
          ((not (null? (cdr keys)))
           (lookup (cdr keys) subtable))
          (else (cdr subtable)))))

(define (set keys value table)
  (if (null? keys)
    #f
    (let ((key (car keys)))
      (let ((entity (assoc key (cdr table))))
        ;; if this is the last key
        (if (null? (cdr keys))
          (if entity
            (set-cdr! entity value)
            (set-cdr! table
                      (cons (cons key value) (cdr table))))
          ;; there are more keys
          (if (not entity)
            (let ((subtable (list key)))
              (set-cdr! table (cons subtable (cdr table)))
              (insert (cdr keys) value subtable))
            (insert (cdr keys) value entity)))))))

;(define table (make-table))
;(insert '(hello world suh dude) 'hi table)
;(insert '(hello world suh dude) 'halloa table)
;(lookup '(hello world suh dude) table)

