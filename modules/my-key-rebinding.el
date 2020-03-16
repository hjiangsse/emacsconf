(setq mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier 'none)

;;bind C-c C-f to function beginning-of-defun
(global-set-key (kbd "C-c C-b") 'beginning-of-defun)
;;bind C-c C-d to function end-of-defun
(global-set-key (kbd "C-c C-e") 'end-of-defun)

;;use register do smater jump in a buffer(or bettween buffers)
(global-set-key (kbd "C-c i") 'point-to-register)  ;;insert current postion into register
(global-set-key (kbd "C-c j") 'jump-to-register)   ;;jump into register position

;;insert empty line blow/above current point
(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)))

(defun insert-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1)))


(global-set-key (kbd "C-c a") 'insert-line-above)
(global-set-key (kbd "C-c b") 'insert-line-below)  

(find-file "~/.emacs.d/module/my-key-rebinding.el")
