; coding: utf-8

;;;; dir-and-file.scm ---  operations with directory and file



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



;;; Keywords: create if not exist directory file wirite



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.february.26



;;; Code:




(define (create-if-not-exist-dir path)
  (if (not (file-exists? path))
      (begin (check-exist-dir (dirname path))
	     (mkdir path))))


(define (create-if-not-exist-file path contents)
  (create-if-not-exist-dir (dirname path))
  (if (not (file-exists? path))
       (write-to-file path contents)))

(define (write-to-file filename contents)
  (define p-file (open-output-file filename))
  (write contents p-file)
  (close p-file))

