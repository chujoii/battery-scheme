; coding: utf-8

;;;; recursive-file-list.scm --- generate rucursive file list



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



;;; Keywords: generate recursive file list



;;; Usage:

;; use it



;;; History:

;; Version 0.1 was created at 2012.february.12



;;; Code:



;;(setlocale LC_ALL "en_US.UTF-8")




;;; help:  see doc    "guile File Tree Walk" : best= file-system-tree
;;; guile-old: ftw, nftw
;;; guile-2.0.5: file-system-tree, ftw, nftw
(use-modules (ice-9 ftw))


;;;### http://sites.google.com/site/robertharamoto/Home/programming/moving-to-guile-2
;;;### this code is free and dedicated to the public domain
;;;#############################################################
;;;#############################################################
;;;###
;;;### load list of *.scm files
;;(define (list-all-scheme-files init-path file-string sub-string)
;;  (let ((counter 0)
;;	(file-list (list)))
;;    (begin
;;      (ice9-ftw:nftw
;;       init-path
;;       (lambda (filename statinfo flag base level)
;;	 (begin
;;	   (if (equal? flag 'regular)
;;	       (begin
;;		 (if (and
;;		      (not (equal? (string-match file-string filename) #f))
;;		      (not (equal? (string-match sub-string filename) #f)))
;;		     (begin
;;		       (set! file-list (append file-list (list (basename filename))))
;;		       ))))
;;	   #t)))
;;      
;;      file-list
;;      )))

(define (list-all-files init-path)
  (let ((file-list (list)))
    (begin
      (nftw init-path
	    (lambda (filename statinfo flag base level)
	      (begin
		(if (equal? flag 'regular)
		    (set! file-list (append file-list (list filename))))
		#t)))

      file-list)))



