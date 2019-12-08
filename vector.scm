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

(load "angle.scm")

(define (square x) (* x x))


;; for distance need add: (sqrt (+ (euclidean-distance a b) (euclidean-distance c d) (euclidean-distance e f) ...))
(define (euclidean-distance a b)
  (square (- a b)))

(define (euclidean-distance-vector a b)
  (define (iter x y)
    (if (or (null? x) (null? y))
	0.0
	(+ (square (- (car x) (car y)))
	   (iter (cdr x) (cdr y)))))

  (sqrt (iter a b)))
;;; unit-testing for euclidean-distance-vector
;;(format #t "Euclidean distance between point (1.0 2.0) and (3.0 4.0): ~7,2f (correct answer: 2.83)\n"
;;	(euclidean-distance-vector (list 1.0 2.0) (list 3.0 4.0)))


;; for distance need add: (sqrt (+ (angle-distance a b) (angle-distance c d) (angle-distance e f) ...))
(define (angle-distance a b)
  (square (min-angle-between-two-angles a b 360)))

(define (angle-distance-vector a b)
  (define (iter x y)
    (if (or (null? x) (null? y))
	0.0
	(+ (square (min-angle-between-two-angles (car x) (car y) 360))
	   (iter (cdr x) (cdr y)))))

  (sqrt (iter a b)))



(define (sum-sub-vectors function a b)
  (map function a b))
;;; unit-testing for sum-vectors
;;(format #t "Adding vectors (1.0 2.0) and (3.0 4.0): ~a\tcorrect answer: (4.0 6.0)\n"
;;	(sum-sub-vectors + (list 1.0 2.0) (list 3.0 4.0)))
;;(format #t "Subtracting vectors (1.0 2.0) and (3.0 4.0): ~a\tcorrect answer: (-2.0 -2.0)\n"
;;	(sum-sub-vectors - (list 1.0 2.0) (list 3.0 4.0)))

(define (mul-div-vector-const function a const)
  (map (lambda (x) (function x const)) a))
;;; unit-testing for sum-vectors
;;(format #t "Multiple vector (3.0 4.0) to constant 2: ~a\tcorrect answer: (6.0 8.0)\n"
;;	(mul-div-vector-const * (list 3.0 4.0) 2))
;;(format #t "Divide vector (3.0 4.0) to constant 2: ~a\tcorrect answer: (1.5 2.0)\n"
;;	(mul-div-vector-const / (list 3.0 4.0) 2))
