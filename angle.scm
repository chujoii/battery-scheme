; coding: utf-8

;;;; vector.scm --- Vector functions for mathematics and physics


;;; Copyright (C) 2019 Roman V. Prikhodchenko



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



;;; Keywords: vector mathematics physics



;;; Usage:

;; use it



;;; History:

;; Project started at 2012-02(Feb)-12



;;; Code:

(define *PI* 3.141592654)

;; max-angle-unit == 360 for degree or (* 2 *PI*) for radians
(define (constrain-angle angle max-angle-unit)
  (let ((a (remainder angle max-angle-unit)))
    (if (< a 0.0)
	(+ a max-angle-unit)
	a)))
;; unit-testing
;;(format #t "359 =? ~d\n" (constrain-angle -721 360))


(define (min-angle-between-two-angles a b max-angle-unit)
  (let ((x (abs (- (constrain-angle a max-angle-unit) ;; no need constranin for x
		   (constrain-angle b max-angle-unit)))))
	   (min x (- max-angle-unit x))))
;; unit-testing
;;(format #t "0 =? ~d\n" (min-angle-between-two-angles 360 0 360))
;;(format #t "20 =? ~d\n" (min-angle-between-two-angles 350 10 360))

