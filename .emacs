;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")t)

;; (add-to-list 'load-path (expand-file-name "c:/Users/trrogers/.emacs.d/elpa/emacs-eclim-20140125.258")) 
(add-to-list 'load-path "~/emacs/neotree")

(package-initialize)

;; Requires
(require 'cl)
(require 'discover)
(require 'neotree)
(require 'eclim)
(require 'eclimd)
(require 'company)
(require 'company-emacs-eclim)
(require 'dirtree)
(require 'compile)
(require 'highlight-symbol)
(require 'visual-regexp-steroids)

;; Modes
(window-numbering-mode 1)
(global-linum-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(global-eclim-mode)
(winner-mode 1):
(global-company-mode t)

;; Global keys
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map (kbd "RET") 'newline-and-indent)


;; Custom Setup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(eclim-eclipse-dirs (quote ("~/Downloads/eclipse")))
 '(eclim-executable "~/Downloads/eclipse/eclim")
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 110)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Org
(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files "~/org" "\.org$"))
;;(setq org-default-notes-file (concat org-directory "/refile.org"))

;;(setq org-capture-templates
;;    '(("t" "Todo" entry

;; Ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Company
(company-emacs-eclim-setup)
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.05)
(help-at-pt-set-timer)

;; Functions
(defun tr/exit-code-helper (cmd rx)
  "Pipe through perl looking for rx."
  (s-concat cmd
            "|perl -e 'my $flag=0; while(<>) { if ($_=~/" rx "/)"
            "{ $flag = 1 } print $_ } exit $flag'"))

(defvar tr/junit-failure-regex "(Failures: [1-9][0-9]*)|(Errors: [1-9][0-9]*)")

(defun tr/eclim-java-junit-all ()
  (interactive)
  (compile (tr/exit-code-helper
            (eclim--make-command (cons "java_junit" (eclim--expand-args '("-p"))))
            tr/junit-failure-regex)))

(defun tr/eclim-java-junit ()
  (interactive)
  (compile (tr/exit-code-helper
            (eclim--make-command (cons "java_junit" (eclim--expand-args '("-p" "-f" "-o"))))
            tr/junit-failure-regex)))


(add-to-list 'compilation-mode-font-lock-keywords
             '("Tests run: [0-9]*, Failures: [1-9][0-9]*,.*$"
               (0 compilation-error-face)))
(add-to-list 'compilation-mode-font-lock-keywords
             '("Tests run: [0-9]*, Failures: 0, Errors: [1-9][0-9]*,.*$"
               (0 compilation-error-face)))
(add-to-list 'compilation-mode-font-lock-keywords
             '("Tests run: [0-9]*, Failures: 0, Errors: 0, Time elapsed: .*$"
               (0 compilation-info-face)))

(defun java-mode-keys ()
  (local-set-key (kbd "C-c o") 'eclim-java-import-organize)
  (local-set-key (kbd "C-c p") 'eclim-problems)
  (local-set-key (kbd "C-c P") 'eclim-problems-open)
  (local-set-key (kbd "C-c d") 'eclim-java-doc-comment)
  (local-set-key (kbd "C-c C-d") 'eclim-java-find-declaration)
  (local-set-key (kbd "C-c C-e") 'eclim-java-find-generic)
  (local-set-key (kbd "C-c C-r") 'eclim-java-find-references)
  (local-set-key (kbd "C-c C-t") 'eclim-java-find-type)
  (local-set-key (kbd "C-c C-f") 'eclim-java-format)
  (local-set-key (kbd "C-c G") 'eclim-java-generate-getter-and-setter)
  (local-set-key (kbd "C-c h") 'eclim-java-hierarchy)
  (local-set-key (kbd "C-c j") 'eclim-java-show-documentation-for-current-element)
  (local-set-key (kbd "C-c r") 'eclim-java-refactor-rename-symbol-at-point)
  (local-set-key (kbd "C-c s") 'eclim-java-method-signature-at-point)
  (local-set-key (kbd "C-c t") 'tr/eclim-java-junit)
  (local-set-key (kbd "C-c T") 'tr/eclim-java-junit-all)
  (local-set-key (kbd "C-c z") 'eclim-java-implement))

(fset 'emphasize-buffer
   "\C-u16\C-x}")
(global-set-key [f5] 'emphasize-buffer)

(add-hook 'java-mode-hook 'java-mode-keys)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


