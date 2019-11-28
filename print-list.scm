; coding: utf-8

;;;; print-list.scm ---  pretty print list



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



;;; Keywords: pretty print list



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2011.december.06



;;; Code:



(define (print-list-without-bracket list)
  ;; print single or two dimension list
  (cond ((null? list)
	 (newline))
	((pair? list)
	 (print-list-without-bracket (car list))
	 (print-list-without-bracket (cdr list)))
	(else
	 (write list)
	 (display " "))))



(define (num-list0 lst)
  ;; use: (display "raw-event-list: ")(write (num-list0 in-lst))(newline)
  (let ((num -1))
    (map (lambda (x)     (set! num (+ num 1)) (string-append (number->string num) "~" x)) lst)))

(define (num-list lst)
  ;; use: (display "raw-event-list: ")(write (num-list in-lst))(newline)
  (define (nl li start)
    (if (eq? li '())
	'()
	(cons (list start (car li)) (nl (cdr li) (+ start 1)))))
  (nl lst 0))


;; generate string with start "list"
;; usage: (print-list-as-list "~d" (list 1 2 (list 3 4 5)))
;; result: "(list 1 2 (list 3 4 5))"
(define (print-list-as-list fmt ls)
  (if (null? ls)
      ""
      (if (not (list? ls))
	  (format #f fmt ls)
	  (string-append "(list "
			 (string-join (map (lambda (x) (print-list-as-list fmt x)) ls))
			 ")"))))
