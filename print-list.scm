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
	 (display list)
	 (display " "))))
