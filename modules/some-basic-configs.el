;;;General configuration
;;reload
(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(global-display-line-numbers-mode)

;;; Other configs
(use-package smart-mode-line)
(fset 'yes-or-no-p 'y-or-n-p)
;;you can edit the minibuffer now
(use-package miniedit
  :commands minibuffer-edit
  :init (miniedit-install))

;;undo tree mode, now you can visually walk though the changes you have made
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;;helper--guide-key, some rescure when you can not remember some keyboard shortcuts
(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
    (guide-key-mode 1)))

;;utf-8 setting
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;;killing text
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;;;Navigation in a buffer
;;Pop to mark, a handy way of getting back to previous places
(cond
 ((string-equal system-type "gnu/linux")
  (progn
    (bind-key "M-s s" 'set-mark-command))))
(bind-key "C-x p" 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

;;windowmove - switching between windows
;;if you boring the "C-x o", use this now"
(use-package windmove
  :bind
  ("M-<right>" . windmove-right)
  ("M-<left>" . windmove-left)
  ("M-<up>" . windmove-up)
  ("M-<down>" . windmove-down))

;;frequently-accessed files

;; smartscan
(use-package smartscan
  :defer t
  :config (global-smartscan-mode t))

;;;Coding...
;;tab width of 4
(setq-default tab-width 4)

;;new lines are always indented
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/kill-back-to-indentation ()
  "kill from point back to the first non-whitespace character on the line."
  (interactive)
  (let ((prev-pos (point)))
	(back-to-indentation)
	(kill-region (point) prev-pos)))
(bind-key "C-M-<backspace>" 'sanityinc/kill-back-to-indentation)

;;show column number
(column-number-mode 1)

;;expand region
(use-package expand-region
  :defer t
  :bind ("C-=". er/expand-region)
  ("C-<prior>" . er/expand-region)
  ("C--" . er/contract-region))

;;smarter move to the begining of the line
(defun my/smarter-move-beginning-of-line (arg)
    "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
	(interactive "^p")
	(setq arg (or arg 1))

	;; Move lines first
	(when (/= arg 1)
	  (let ((line-move-visual nil))
		(forward-line (1- arg))))

	(let ((orig-point (point)))
	  (back-to-indentation)
	  (when (= orig-point (point))
		(move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
				                'my/smarter-move-beginning-of-line)

;;neotree settings
(use-package neotree)
(global-set-key (kbd "M-s n") 'neotree-toggle)

;;not welcome me any more
(setq inhibit-startup-screen t)
