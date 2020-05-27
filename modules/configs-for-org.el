;;add org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;bind "C-c n" as the short cut to insert-code-snippet
(add-hook 'org-mode-hook
		  (lambda ()
				  (local-set-key (kbd "C-c n") #'insert-code-snippet)))
