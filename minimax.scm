;;;; minimax.scm ---  some minmum, maximum and scale functions



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



;;; Keywords: min minimum max maximum list scale constrain



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.july.05



;;; Code:




(define (index-of-max lst)
  (define (indmax im mm lst counter)
    (if (null? lst)
	im
	(if (> (car lst) mm)
	    (indmax counter (car lst) (cdr lst) (+ counter 1))
	    (indmax im mm (cdr lst) (+ counter 1)))))
  (indmax 0 (car lst) lst 0))

(define (scale x in-min in-max out-min out-max)
  (let ((dividend (* (- x in-min) (- out-max out-min)))
	(divisor (+ (- in-max in-min) out-min)))
  (/ dividend
     (if (= divisor 0) 1 divisor))))


(define (scale-proportional x in-max out-max)
  ;; if in-min=0 and out-min=0
  (cond ((= x 0) 0)
	((= in-max 0) 0)
	(else (/ (* x out-max)
		 in-max))))


(define (constrain x a b)
  (cond ((< x a) a)
	((> x b) b)
	(else    x)))
