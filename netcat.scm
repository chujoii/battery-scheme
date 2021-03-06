;;;; netcat.scm ---  some netcat functions



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



;;; Keywords: netcat network nc



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.july.05



;;; Code:


(use-modules (ice-9 rdelim))


(define (nc net-host net-port)
  (define (cycle-read stream result)
    (let ((line (read-line stream)))
      (if (eof-object? line)
	  result
	  (cycle-read stream (append result (list line)))))) ;; fixme? append -> cons ?
  
  (let ((s (socket PF_INET SOCK_STREAM 0)))
    (connect s AF_INET (inet-pton AF_INET net-host) net-port)
    (let ((res (cycle-read s '())))
      (close-port s)
      res)))
