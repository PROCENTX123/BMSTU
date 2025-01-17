(use-syntax (ice-9 syncase))
(define (make-source x . false)
  (cond
    ((null? false) (make-source x '#f))
    ((string? x) (append (string->list x) false))
    ((vector? x) (append (vector->list x) false))
    ((list? x) (append x false))))
(define (peek x)
  (if (list? x)
      (car x)
      #f))
(define-syntax next
  (syntax-rules ()
    ((_ x)
     (if (list? x)
         (if (null? (cdr x))
             (car x)
             (let ((a (car x)))
               (set! x (cdr x))
               a))
           #f))))
