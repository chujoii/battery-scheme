; coding: utf-8

(setlocale LC_ALL "en_US.UTF-8")



;(define (read-raw-file filename)
;  (define info-file (open-input-file filename))
;  (let ((data (read info-file)))
;    (close info-file)
;    data))
;


;(use-modules (ice-9 rw))
;(define (file-contents file)
;  ;; from http://pleac.sourceforge.net/pleac_guile/filecontents.html
;  ;; fixme need check exist of file
;  (call-with-input-file file
;    (lambda (p)
;      (set-port-encoding! p "UTF-8")
;      (let* ((size (stat:size (stat p)))
;             (buf (make-string size)))
;	
;        (read-string!/partial buf p)
;        buf))))


(use-modules (ice-9 rdelim))
(define (file-contents filename)
  (define (read-file-contents file-port content)
    (let ((line (read-line file-port)))
      (if (eof-object? line)
	  content
	  (if (equal? content "")   ;; fixme : need remove (first OR last) unnecessary \n but this metod toooooo slow ? or not for big file
	      (read-file-contents file-port line)
	      (read-file-contents file-port (string-join (list content "\n" line) ""))))))
  
  (let ((p (open-file filename "rb")))
    (set-port-encoding! p "UTF-8")
    (let ((contents (read-file-contents p "")))
      (close p)
      contents)))




