; coding: utf-8

(setlocale LC_ALL "en_US.UTF-8")


(use-modules (ice-9 popen))
(use-modules (ice-9 rdelim))
;;
(define (system-with-output-to-string command)
  ;; read result of system call
  ;;
  ;; http://sources.redhat.com/ml/guile/2000-09/msg00102.html 
  ;; this code is free and dedicated to the public domain
  ;;
  ;; author
  ;; Dale P. Smith
  ;; Altus Technologies Corp.
  ;; dsmith@altustech.com
  ;; 400-746-9000 x309
  ;;
  ;;
  ;;
  ;;
  ;; but this function not work with encoding :(
  ;; see 
  ;; http://www.mail-archive.com/guile-devel@gnu.org/msg07455.html
  ;; for detail
  ;;
  (let* ((p (open-input-pipe command)))
    (set-port-encoding! p "UTF-8")
    (let ((output (read-delimited "" p)))
      (if (eof-object? output)
	  ""
	  output))))

;;(display (system-with-output-to-string "./a1.sh \"проверка\"")) ;; not work
;;(system "./a1.sh \"проверка\"") ;; work






;; ------------ previous function not work with utf-8  guile (GNU Guile) 2.0.1
;; but prework in git version (guile (GNU Guile) 2.1.0.48-3c65e)

;(load "file-contents.scm")
;(define (system-with-output-to-string command)
;  ;; fixme this fynction unsecure and generate temporary file (bad for ssd-disk)
;  (let ((tmp-file (tmpnam)))
;    (system (string-join (list command " > " tmp-file)))
;    (let ((content-tmp-file (file-contents tmp-file)))
;      (delete-file tmp-file)
;      content-tmp-file)))




