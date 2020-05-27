;;;-------------------------setup erlang-mode for emacs-------------------------
(setq erlang-root-dir "/usr/local/lib/erlang/")
(setq load-path (cons (concat erlang-root-dir "lib/tools-3.3.1/emacs") load-path))
(require 'erlang-start)
(setq exec-path (cons (concat erlang-root-dir "bin") exec-path))
(setq erlang-man-root-dir (concat erlang-root-dir "man"))

