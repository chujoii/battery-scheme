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

;; Project started at 2019-11(Nov)-14



;;; Code:



(define (square x) (* x x))



(define (euclidean-distance a b)
  (define (iter x y)
    (if (or (null? x) (null? y))
	0.0
	(+ (square (- (car x) (car y)))
	   (iter (cdr x) (cdr y)))))

  (sqrt (iter a b)))

; unit-testing for euclidean-distance
;(format #t "\nEuclidean distance between point (1.0 2.0) and (3.0 4.0): ~7,2f (correct answer: 2.83)\n"
;	(euclidean-distance (list 1.0 2.0) (list 3.0 4.0)))
