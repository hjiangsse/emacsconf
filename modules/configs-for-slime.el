(add-to-list 'ac-modes 'slime-mode)
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'common-lisp-mode)

(defun auto-complete-mode-maybe ()
  (auto-complete-mode 1))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
