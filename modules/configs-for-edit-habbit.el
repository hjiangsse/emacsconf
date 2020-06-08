;;;----------------------highlight text beyond 80th column----------------------
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(setq whitespace-line-column 80)
(global-whitespace-mode t)

;;;------------------------disable tabs for indentation-------------------------
(setq-default indent-tabs-mode nil)

;;;-----------------------highlight trailing whitespaces------------------------
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;;;---------------switch between windows with Alt-<window number>---------------
(use-package window-number)
(require 'window-number)
(window-number-mode)
(window-number-meta-mode)

;;;--------------switch to next/previous buffer with a single key---------------
(autoload 'cycle-buffer "cycle-buffer"
  "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer"
  "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer"
  "Cycle forward allowing  *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer"
  "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer"
  "Toggle if this buffer will be considered." t)

(global-set-key [(f9)] 'cycle-buffer-backward)
(global-set-key [(f10)] 'cycle-buffer)
(global-set-key [(shift f9)] 'cycle-buffer-backward-permissive)
(global-set-key [(shift f10)] 'cycle-buffer-permissive)

;;;----------------------------untabifying a buffer-----------------------------
(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (save-excursion (untabify (point-min) (point-max))))
