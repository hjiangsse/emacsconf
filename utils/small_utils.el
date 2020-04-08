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
