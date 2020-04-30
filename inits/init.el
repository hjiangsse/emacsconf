;; emacs start
(require 'package)
(package-initialize)
(setq use-package-always-ensure t)
(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;;-----------------add personal config file path to load-path------------------
(add-to-list 'load-path "~/.emacs.d/utils/")
(add-to-list 'load-path "~/.emacs.d/modules/")

;;;------------------------------load samll utils-------------------------------
(load "small-utils.el")

;;;----------------------------load my config files-----------------------------
(load "back-history-window.el")
(load "configs-for-org.el")
(load "font-and-theme.el")
(load "package-source-setting.el")
(load "chinese-input-method.el")
(load "configs-for-rust.el")
(load "helm-in-emacs.el")
(load "my-key-rebinding.el")
(load "some-basic-configs.el")
(load "configs-for-gofer.el")
(load "configs-for-slime.el")
(load "org-bullets-setting.el")
(load "use-package-setting.el")

(put 'narrow-to-region 'disabled nil)
