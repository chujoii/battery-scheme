;;;; list.scm ---  some list function



;;; Copyright (C) 2012 Roman V. Prikhodchenko



;;; Author: Roman V. Prikhodchenko <chujoii@gmail.com>



;;;    This file is part of battery-scheme.
;;;
;;;    battery-scheme is free software: you can redistribute it and/or modify
;;;    it under the terms of the GNU General Public License as published by
;;;    the Free Software Foundation, either version 3 of the License, or
;;;    (at your option) any later version.
;;;
;;;    battery-scheme is distributed in the hope that it will be useful,
;;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;    GNU General Public License for more details.
;;;
;;;    You should have received a copy of the GNU General Public License
;;;    along with battery-scheme.  If not, see <http://www.gnu.org/licenses/>.



;;; Keywords: list last pair



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.february.12



;;; Code:





(define (except-last-pair lst)
  (list-head lst (- (length lst) 1)))



(define (make-increment-list n static-part dynamic-start)
  ;; (make-increment-list 5 "abc" 3) => '("abc3" "abc4" "abc5" "abc6" "abc7")
  (map (lambda (x) (format #f "~a~d" (cadr x) (+ (car x) dynamic-start)))
       (num-list (make-list n static-part))))




(define list-and
    ;; http://stackoverflow.com/questions/387775/using-and-with-the-apply-function-in-scheme
  (lambda x 
    (if (null? x)
        #t
        (if (car x)
            (apply list-and (cdr x))
            #f))))

(define (list-from-to lst start end)
  ;; (list-from-to (list 0 1 2 3 4 5 6 7 8 9) 2 7)
  ;; return:                (2 3 4 5 6 7)
  (list-tail (list-head lst (+ end 1)) start))

(define (list-unref lst k)
  ;; return new list without k-element
  ;; (list-unref (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m") 5)
  ;; index              0   1   2   3   4   5   6   7   8   9   10   11 12) 5)
  ;; return           ("a" "b" "c" "d" "e"     "g" "h" "i" "j" "k" "l" "m")
  (append (list-head lst k) (list-tail lst (+ k 1))))



(define (rnd-index num)
  ;; (rnd-index 5)
  ;; return for example: (1 3 4 2 0)

  (define (rnd-r lst)
    (let ((len (length lst)))
      (if (= len 0)
	  '()
	  (let ((rnd (random len)))
	    (cons (list-ref lst rnd) (rnd-r (list-unref lst rnd)))))))

  (rnd-r (xrange 0 (- num 1))))
	  



(define (randomize-list lst)
  (map (lambda (x) (list-ref lst x)) (rnd-index (length lst))))




(define (list-fill lst fill-len fill-symbol after)
  ;; (list-fill `(1 2 3) 5 0 #t) -> (1 2 3 0 0)
  ;; (list-fill `(1 2 3) 5 0 #f) -> (0 0 1 2 3)
  (let ((real-len (length lst)))
    (if (>= real-len fill-len)
	lst
	(if after
	    (append lst (make-list (- fill-len real-len) fill-symbol))
	    (append (make-list (- fill-len real-len) fill-symbol) lst)))))



(define (list-to-num list-of-bit)
  ;; fixme?: input list contains only 1 or 0 !
  ;; so (list-to-num `(1 0 1)) = 5
  (define (list-to-num-recursive lst counter)
    (if (null? lst)
	`()
	(cons (* (car lst) (ash 1 counter))
	      (list-to-num-recursive (cdr lst) (1- counter)))))
  
  (apply logior (list-to-num-recursive list-of-bit (1- (length list-of-bit)))))



(define (num-to-list-reversed num base)
  ;; (num-to-list 312 10) -> (2 1 3)
  ;; (num-to-list 312 2) -> (0 0 0 1    1 1 0 0    1)
  ;; length of result - different (fixme? use: list-fill)
  (if (< num base)
      (cons num `())
      (cons (remainder num base)
	    (num-to-list-reversed (quotient num base) base))))


(define (num-to-list number base)
  ;; (num-to-list 312 10) -> (3 1 2)
  ;; (num-to-list 312 2) -> (1    0 0 1 1    1 0 0 0)
  ;; length of result - different (fixme? use: list-fill)
  
  (reverse (num-to-list-reversed number base)))
