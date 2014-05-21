;;; clojure-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (clojure-mode) "clojure-mode" "clojure-mode.el"
;;;;;;  (21372 61495 781640 594000))
;;; Generated autoloads from clojure-mode.el

(autoload 'clojure-mode "clojure-mode" "\
Major mode for editing Clojure code.

Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.
Semicolons start comments.

\\{clojure-mode-map}

Note that `run-lisp' may be used either to start an inferior Lisp
job or to switch back to an existing one.

Entry to this mode calls the value of `clojure-mode-hook' if that
value is non-nil.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.clj[sx]?\\'" . clojure-mode))

(add-to-list 'auto-mode-alist '("\\.dtm\\'" . clojure-mode))

(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(add-to-list 'interpreter-mode-alist '("jark" . clojure-mode))

(add-to-list 'interpreter-mode-alist '("cake" . clojure-mode))

;;;***

;;;### (autoloads nil nil ("clojure-mode-pkg.el") (21372 61495 799527
;;;;;;  380000))

;;;***

(provide 'clojure-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; clojure-mode-autoloads.el ends here
