; coding: utf-8

;;;; logic.scm --- some logic function



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



;;; Keywords: logic list and



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2011.july.06



;;; Code:



(define list-and
    ;; http://stackoverflow.com/questions/387775/using-and-with-the-apply-function-in-scheme
  (lambda x 
    (if (null? x)
	#t
	(if (car x)
	    (apply list-and (cdr x))
	    #f))))

