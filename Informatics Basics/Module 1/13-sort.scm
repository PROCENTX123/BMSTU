(define (selection-sort proc lst)
  (if (null? lst)
      '()
      (selection-sort-helper proc (smallest proc lst) lst)))
(define (selection-sort-helper proc smallest-value lst)
  (cons smallest-value (selection-sort proc (list-remove lst smallest-value))))
(define (smallest proc lst)
  (if (null? (cdr lst))
      (car lst)
      (smaller proc (car lst) (smallest proc (cdr lst)))))
(define (smaller proc val1 val2)
  (if (proc val1 val2) 
      val1 
      val2))
(define (list-remove lst val)
  (if (eq? val (car lst))
      (cdr lst)
      (cons (car lst) (list-remove (cdr lst) val))))
(define (insert proc x lst)
  (if (null? lst)
      (list x)
      (let ((y (car lst))
            (ys (cdr lst)))
        (if (proc x y)
            (cons x lst)
            (cons y (insert proc x ys))))))
(define (insertion-sort proc lst)
  (if (null? lst)
      '()
      (insert proc (car lst) (insertion-sort proc (cdr lst)))))
