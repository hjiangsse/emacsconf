(use-package haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

;; Haskell interactive mode setup
(require 'haskell-interactive-mode)
(require 'haskell-process)

(defun interactive-haskell-mode-on ()
  (interactive-haskell-mode t))

(add-hook 'haskell-mode-hook 'interactive-haskell-mode-on)
