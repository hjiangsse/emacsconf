;; emacs start
(require 'package)
(package-initialize)
(setq use-package-always-ensure t)
(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

(add-to-list 'load-path "~/.emacs.d/elisp/")

(load "~/.emacs.d/module/package-source-setting.el")
(load "~/.emacs.d/module/use-package-setting.el")
(load "~/.emacs.d/module/back-history-window.el")
(load "~/.emacs.d/module/helm-in-emacs.el")
(load "~/.emacs.d/module/some-basic-configs.el")
(load "~/.emacs.d/module/chinese-input-method.el")
(load "~/.emacs.d/module/my-key-rebinding.el")
(load "~/.emacs.d/module/configs-for-gofer.el")
(load "~/.emacs.d/module/font-and-theme.el")

(setq inferior-lisp-program "sbcl")

