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

;;;-------------------------hide and show code for rust-------------------------
;;(defun hs-mode-setup()
;;  ;;set up for hide show code block mode
;;  (local-set-key (kbd "<f5>") 'hs-show-all)
;;  (local-set-key (kbd "<f6>") 'hs-hide-all)
;;  (local-set-key (kbd "<f7>") 'hs-show-block)
;;  (local-set-key (kbd "<f8>") 'hs-hide-block))

(add-hook 'rust-mode-hook 'hs-minor-mode)
(add-hook 'rust-mode-hook 'hs-mode-setup)
