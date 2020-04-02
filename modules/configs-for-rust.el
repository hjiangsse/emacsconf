(add-to-list 'load-path "/Users/hjiang/.emacs.d/elpa/rust-mode")
(autoload 'rust-mode "rust-mode" nil t)

(require 'rust-mode)

(add-hook 'rust-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(defun auto-complete-for-rust ()
  (auto-complete-mode 1))

(add-hook 'rust-mode-hook 'auto-complete-for-rust)

