(use-package go-mode)
(use-package exec-path-from-shell)

;;;------------------------set exec path from shell path------------------------
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
						  "[ \t\n]*$"
						  ""
						  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
	(setenv "PATH" path-from-shell)
	(setq eshell-path-env path-from-shell) ; for eshell users
	(setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(require 'go-projectile)
(require 'gotest)
(require 'go-mode)
(require 'go-autocomplete)
(require 'go-eldoc)
(require 'auto-complete-config)
(require 'golint)

(ac-config-default)
;;;-------------------------add some setup for go mode--------------------------
(defun go-mode-setup()
	(go-eldoc-setup)
	(setq gofmt-command "goimports")
	(add-hook 'before-save-hook 'gofmt-before-save)
	(local-set-key (kbd "M-.") 'godef-jump)
	(local-set-key (kbd "M-,") 'pop-tag-mark))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(defun flyspell-for-go ()
  (flyspell-mode 1))

(defun running-and-testing ()
  "running and testing current file"
  (local-set-key (kbd "C-c C-c C-r") 'go-run)
  (local-set-key (kbd "C-c .") 'go-test-current-test)
  (local-set-key (kbd "C-c m") 'go-test-current-file)
  (local-set-key (kbd "C-c a") 'go-test-current-project))

(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'go-mode-hook 'electric-pair-mode)
(add-hook 'go-mode-hook 'running-and-testing)

(setq electric-pair-preserve-balance nil)
;;(add-hook 'go-mode-hook 'flyspell-for-go)

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

;;;-----------------------test benching function at point-----------------------
(defun benching-at-point()
  ;;benching the function at point
  (interactive)
  (let* ((curr-func-name (get-word-on-point))
		 (bench-cmd (concat "go test -bench=" curr-func-name " .")))
	(shell-command bench-cmd)))

(defun benching-all ()
  ;;benching all the benchmark function in current file
  (interactive)
  (let ((bench-cmd (concat "go test -bench=. .")))
	(shell-command bench-cmd)))

(defun benching-golang ()
  "running and testing current file"
  (local-set-key (kbd "C-c C-c C-b") 'benching-at-point)
  (local-set-key (kbd "C-c C-c C-a") 'benching-all))

(add-hook 'go-mode-hook 'benching-golang)

;;;---------------------------------golang lint---------------------------------
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/golang.org/x/lint/misc/emacs/"))
(require 'golint)

