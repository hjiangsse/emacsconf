(use-package go-mode)
(use-package exec-path-from-shell)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
						  "[ \t\n]*$"
						  ""
						  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
	(setenv "PATH" path-from-shell)
	(setq eshell-path-env path-from-shell) ; for eshell users
	(setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(require 'go-mode)
(require 'go-autocomplete)
(require 'go-eldoc)
(require 'auto-complete-config)
(require 'golint)

(defun go-mode-setup()
  (setq compile-command "go build -v && go test -v && go vet && golint")
  ;;(define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark))

(defun hs-mode-setup()
  ;;set up for hide show code block mode
  (local-set-key (kbd "<f5>") 'hs-show-all)
  (local-set-key (kbd "<f6>") 'hs-hide-all)
  (local-set-key (kbd "<f7>") 'hs-show-block)
  (local-set-key (kbd "<f8>") 'hs-hide-block))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(defun flyspell-for-go ()
  (flyspell-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'go-mode-hook 'electric-pair-mode)
(setq electric-pair-preserve-balance nil)
;;(add-hook 'go-mode-hook 'flyspell-for-go)

(add-hook 'go-mode-hook 'hs-minor-mode) ;;hide or show block of code
(add-hook 'go-mode-hook 'hs-mode-setup) ;;hide and show mode setup for golang

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(defun insert-golang-template ()
  "insert golang source template"
  (interactive)
  (insert-file-contents "~/.emacs.d/templates/golang.txt"))

(defun insert-golang-ddt-template ()
  "insert golang data drive test template"
  (interactive)
  (insert-file-contents "~/.emacs.d/templates/golang_ddt.txt"))

;;;---------------------------------golang lint---------------------------------
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/golang.org/x/lint/misc/emacs/"))
(require 'golint)
