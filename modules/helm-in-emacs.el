(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
	  helm-input-idle-delay 0.01  ; this actually updates things
				      ; reeeelatively quickly.
	  helm-yas-display-key-on-candidate t
	  helm-quick-update t
	  helm-M-x-requires-pattern nil
	  helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
		 ("C-h a" . helm-apropos)
		 ("C-x C-b" . helm-buffers-list)
		 ("C-x b" . helm-buffers-list)
		 ("M-y" . helm-show-kill-ring)
		 ("M-x" . helm-M-x)
		 ("C-x c o" . helm-occur)
		 ("C-x c s" . helm-swoop)
		 ("C-x c y" . helm-yas-complete)
		 ("C-x c Y" . helm-yas-create-snippet-on-region)
		 ("C-x c b" . my/helm-do-grep-book-notes)
		 ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1)

(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
	 ("C-h w" . helm-descbinds)))

;;Helm swoop -quickly finding lines
(use-package helm-swoop
  :bind
  (("C-S-s" . helm-swoop)
   ("M-i" . helm-swoop)
   ("M-s M-s" . helm-swoop)
   ("M-I" . helm-swoop-back-to-last-point)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all)
   )
  :config
  (progn
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)))
