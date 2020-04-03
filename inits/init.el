;; emacs start
(require 'package)
(package-initialize)
(setq use-package-always-ensure t)
(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

(add-to-list 'load-path "~/.emacs.d/utils/")
(load "~/.emacs.d/utils/small-utils.el")

(add-to-list 'load-path "~/.emacs.d/modules/")

(load "~/.emacs.d/modules/back-history-window.el")
(load "~/.emacs.d/modules/configs-for-org.el")
(load "~/.emacs.d/modules/font-and-theme.el")
(load "~/.emacs.d/modules/package-source-setting.el")
(load "~/.emacs.d/modules/chinese-input-method.el")
(load "~/.emacs.d/modules/configs-for-rust.el")
(load "~/.emacs.d/modules/helm-in-emacs.el")
(load "~/.emacs.d/modules/my-key-rebinding.el")
(load "~/.emacs.d/modules/some-basic-configs.el")
(load "~/.emacs.d/modules/configs-for-gofer.el")
(load "~/.emacs.d/modules/configs-for-slime.el")
(load "~/.emacs.d/modules/org-bullets-setting.el")
(load "~/.emacs.d/modules/use-package-setting.el")

(setq inferior-lisp-program "sbcl")

