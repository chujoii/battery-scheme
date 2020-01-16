; coding: utf-8

;;;; unique-list.scm ---  generate list contain unique element



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



;;; Keywords: unique list



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.february.12



;;; Code:


(define (xrange from to)
  (if (= from to) (list to) (cons from (xrange (+ from 1) to))))

(define (unique-list list)
  (define (element-of-set? x set)
    ;; from sicp
    (cond ((null? set) #f)
	  ((equal? x (car set)) #t)
	  (else (element-of-set? x (cdr set)))))
  
  (define (unique src-list uniq-list)
    (cond ((null? src-list) uniq-list)
	  ((not (element-of-set? (car src-list) uniq-list)) (unique (cdr src-list) (cons (car src-list) uniq-list)))
	  (else (unique (cdr src-list) uniq-list))))
  (unique list '()))
