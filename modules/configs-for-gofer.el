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

(setenv "GOPATH" "/home/hjiang/go")
(add-to-list 'exec-path "/usr/local/go/bin/go")
(add-to-list 'exec-path "/home/hjiang/go/bin")


;;(defun my-go-mode-hook ()
;;  ; Use goimports instead of go-fmt
;;  (setq gofmt-command "goimports")
;;  ; Call Gofmt before saving
;;  (add-hook 'before-save-hook 'gofmt-before-save)
;;  ; Customize compile command to run go build
;;  (if (not (string-match "go" compile-command))
	  ;;(set (make-local-variable 'compile-command)
		   ;;"go build -v && go test && go vet"))
  ;;; Godef jump key binding
  ;;(local-set-key (kbd "M-.") 'godef-jump)
  ;;(local-set-key (kbd "M-,") 'pop-tag-mark)
  ;;(local-set-key (kbd "M-p") 'compile)
  ;;(local-set-key (kbd "M-P") 'recompile)
  ;;(local-set-key (kbd "M-]") 'next-error)
  ;;(local-set-key (kbd "M-[") 'previous-error))
;;
;;(add-hook 'go-mode-hook 'my-go-mode-hook)
;;
;;;;auto complete mode for golang
;;(use-package auto-complete)
;;(defun auto-complete-for-go ()
;;  (auto-complete-mode 1))
;;(add-hook 'go-mode-hook 'auto-complete-for-go)
;;
;;(use-package go-autocomplete)
;;(with-eval-after-load 'go-mode
;;  (require 'go-autocomplete))

(require 'go-mode)
(require 'go-autocomplete)
(require 'go-eldoc)
(require 'auto-complete-config)
(require 'golint)

(defun go-mode-setup()
  (setq compile-command "go build -v && go test -v && go vet && golint")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(defun flyspell-for-go ()
  (flyspell-mode 1))

(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'go-mode-hook 'go-mode-setup)
;;(add-hook 'go-mode-hook 'flyspell-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
