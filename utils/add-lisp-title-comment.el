;;;----------------------add comment to a lisp buffer line----------------------
(defun add-lisp-comment-title ()
  "Promote user input the comment title"
  (interactive)
  (let ((title (read-string "Input your comment title: "))
	    (prio (string-to-number (read-string "Input priority: "))))
	(insert-prior-head prio)
	(let* ((space-num (- 77 (length title)))
		   (first-segs (/ space-num 2))
		   (second-segs (- space-num first-segs)))
	  (insert-n-char first-segs "-")
	  (insert title)
	  (insert-n-char second-segs "-"))))

(defun insert-n-char (n c)
  "insert character c n times"
  (dotimes (i n)
	(insert c)))

(defun insert-prior-head (prio)
  "Insert priority head"
  (insert-n-char prio ";"))

;;;-----------------------------------testing-----------------------------------
(insert-n-characters 10 "*")
(add-lisp-comment-title)
	
