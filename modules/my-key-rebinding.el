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

(global-set-key (kbd "C-c a") 'insert-line-above)
(global-set-key (kbd "C-c b") 'insert-line-below)  

(find-file "~/.emacs.d/modules/my-key-rebinding.el")

;;;-----------------------disable left, right, up, down ------------------------
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))
