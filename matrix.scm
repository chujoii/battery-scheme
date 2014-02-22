(define (transpose x)
  ;; ((1 2) (3 4) (5 6) (7 8)) -> ((1 3 5 7) (2 4 6 8))
  ;; from "Lisp Idioms" http://cybertiggyr.com/lid/ 
  ;; How does this works? 
  ;; (cons 'list l) returns (list 'list (car l)(cadr l) etc....),
  ;; then apply calls mapcar with all that's in the list as arguments,
  ;; (mapcar 'list (car l)(cadr l)...)
  ;;
  ;; or
  ;; sicp 2.36, 2.37
  ;; (apply #'mapcar (cons #'list x)))
  (apply map list x))
