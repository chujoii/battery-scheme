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
