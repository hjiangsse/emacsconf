;;;-----------------------------load zenburn theme------------------------------
(defun load-zen-burn-theme ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package zenburn-theme)
  (load-theme 'zenburn t))

;;;-----------------------load solarized theme for emacs------------------------
(defun load-zen-solarized-theme-light ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package solarized-theme)
  (load-theme 'solarized-light t))

(defun load-zen-solarized-theme-dark ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package solarized-theme)
  (load-theme 'solarized-dark t))

;;;------------------------load synityinc tomorrow theme------------------------
(defun load-sanityinc-tomorrow-day ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package color-theme-sanityinc-tomorrow)
  (load-theme 'sanityinc-tomorrow-day t))

(defun load-sanityinc-tomorrow-night ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package color-theme-sanityinc-tomorrow)
  (load-theme 'sanityinc-tomorrow-night t))

(defun load-sanityinc-tomorrow-blue ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package color-theme-sanityinc-tomorrow)
  (load-theme 'sanityinc-tomorrow-blue t))

(defun load-sanityinc-tomorrow-bright ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package color-theme-sanityinc-tomorrow)
  (load-theme 'sanityinc-tomorrow-bright t))

(defun load-sanityinc-tomorrow-eighties ()
  "Load zen burn theme for emacs"
  (interactive)
  (use-package color-theme-sanityinc-tomorrow)
  (load-theme 'sanityinc-tomorrow-eighties t))

;;;--------------------------------switch themes--------------------------------
(setq themes-lst (list #'load-zen-burn-theme
                      #'load-zen-solarized-theme-dark
                      #'load-zen-solarized-theme-light
                      #'load-sanityinc-tomorrow-day
                      #'load-sanityinc-tomorrow-night
                      #'load-sanityinc-tomorrow-blue
                      #'load-sanityinc-tomorrow-bright
                      #'load-sanityinc-tomorrow-eighties))


(defvar curr-theme-index 0)
(defvar switch-themes-index nil)

(let ((curr-theme-index 0))
  (setq switch-themes-index
        (lambda ()
          (if (= (1+ curr-theme-index) (safe-length themes-lst))
              (setq curr-theme-index 0)
            (setq curr-theme-index (1+ curr-theme-index))))))

(defun switch-themes ()
  "Switch themes in theme-lst"
  (interactive)
  (funcall (nth (funcall switch-themes-index) themes-lst)))

(global-set-key [(f5)] 'switch-themes)
