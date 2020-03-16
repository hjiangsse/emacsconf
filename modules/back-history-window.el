;;libraries
(use-package dash :ensure t)
(use-package diminish :ensure t)

;;handle emacs backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control -1)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;;handle emacs history
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;;;Windows configuration
(tool-bar-mode -1)
(display-time-mode 1)
;;winner mode
(use-package winner
  :defer t)
(setq sentence-end-double-space nil)
