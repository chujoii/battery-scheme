; coding: utf-8

;;;; string.scm ---  some string functions



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



;;; Keywords: string cut



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.february.12



;;; Code:




(use-modules (ice-9 regex))

(define (string-cut s start end)
  (let ((strlen (string-length s)))
    (string-drop (string-take s (cond ((< end 0) (+ strlen end))
				      ((> end strlen) strlen)
				      (else end)))
		 start)))



(define (search-first-string-in-list lst str)
  (if (null? lst)
      '()
      (let ((str-ind (string-contains-ci (car lst) str)))
	(if str-ind
	    (car lst)
	    (search-first-string-in-list (cdr lst) str)))))
