(package-initialize nil)

(add-to-list 'load-path "~/.emacs.d")

(package-initialize t)

(setq package-enable-at-startup nil)

(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/robo-babel.org"))
