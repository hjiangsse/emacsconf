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


(defun move-forward-n-char (n)
  (dotimes (i n)
	(insert " ")))

;;;---------------------------insert org code snippet---------------------------
(defun insert-code-snippet ()
  "insert a code snippet in current position"
  (interactive)
  (let ((old-pos (point))
		(line-begin-dist (- (point) (line-beginning-position))))
	(insert "#+BEGIN_SRC")
	(newline-and-indent)
	(newline-and-indent)
    (previous-line)
	(move-forward-n-char line-begin-dist)
	(insert "#+END_SRC")
	(goto-char old-pos)))

(defun get-file-contents (filename)
  "return the content of FILENAME"
  (with-temp-buffer
	(insert-file-contents filename)
	(buffer-string)))

;;;----------------------insert empty line below or above-----------------------
(defun insert-empty-line-below ()
  "insert an empty line below current position"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun insert-empty-line-above ()
  "insert an empty line above current position"
  (interactive)
  (previous-line)
  (insert-empty-line-below))
  
(global-set-key (kbd "<M-return>") 'insert-empty-line-below)
(global-set-key (kbd "<C-return>") 'insert-empty-line-above)

;;;---------------------general change regions to comments----------------------
(defun general-comment-region (comment)
  ;;comment a region in current buffer, only useful for rust
  (let ((end-region (region-end)))
	(goto-char (region-beginning))
	(beginning-of-line)
	(while (< (point) end-region)
	  (insert comment)
	  (next-line)
	  (beginning-of-line)
	  (setf end-region (+ (length comment) end-region)))))

;;;-------------------------------miscellaneous--------------------------------
(defun move-forward-n-char (n)
  (dotimes (i n)
	(insert " ")))

(defun insert-code-snippet ()
  "insert a code snippet in current position"
  (interactive)
  (let ((old-pos (point))
		(line-begin-dist (- (point) (line-beginning-position))))
	(insert "#+BEGIN_SRC")
	(newline-and-indent)
    (next-line)
	(move-forward-n-char line-begin-dist)
	(insert "#+END_SRC")
	(goto-char old-pos)))

(defun get-file-contents (filename)
  "return the content of FILENAME"
  (with-temp-buffer
	(insert-file-contents filename)
	(buffer-string)))

(defun insert-golang-template ()
  "insert golang template file"
  (interactive)
  (insert (get-file-contents "~/.emacs.d/template/golang_temp.go")))

(defun new-what-line ()
  "print the current line number (in the buffer) of point"
  (interactive)
  (save-restriction
	(widen)
	(save-excursion
	  (beginning-of-line)
	  (message "Line %d" (1+ (count-lines 1 (point)))))))
