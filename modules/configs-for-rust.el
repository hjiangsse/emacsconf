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

;;;--------------------------------flycheck-rust--------------------------------
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
