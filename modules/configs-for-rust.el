(use-package cargo)
(use-package rust-mode)
(use-package racer)
(use-package flycheck-rust)

(add-hook 'rust-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(defun auto-complete-for-rust ()
  (auto-complete-mode 1))

(add-hook 'rust-mode-hook 'auto-complete-for-rust)

;;;------------------------------cargo-minor-mode-------------------------------
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;;;-------------------------------rustfmt setting-------------------------------
(setq rust-format-on-save t)

;;;------------------------------------racer------------------------------------
(setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
(setq recer-rust-src-path (concat (getenv "HOME") "/Code/rust/src"))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;;;--------------------------------flycheck-rust--------------------------------
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;;;-----------------------add documentation for rust code-----------------------
(defun comment-rust-region-follow ()
  ;;comment the code follow current region
  (interactive)
  (general-comment-region "///"))

(defun comment-rust-region-contain ()
  ;;comment the code contain current region
  (interactive)
  (general-comment-region "//!"))

;;;------------------------------rust local setup-------------------------------
(defun rust-local-setup ()
  (local-set-key (kbd "C-c m") #'comment-rust-region-follow)
  (local-set-key (kbd "C-c c") #'comment-rust-region-contain))

(add-hook 'rust-mode-hook #'rust-local-setup)
