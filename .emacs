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
(add-to-list 'load-path "~/emacs/erc-highlight-nicknames")

(package-initialize)

;; Requires
(require 'cl)
(require 'cl-lib)			
(require 'discover)
(require 'eclim)
(require 'eclimd)
(require 'company)
(require 'company-emacs-eclim)
(require 'dirtree)
(require 'compile)
(require 'highlight-symbol)
(require 'visual-regexp-steroids)
(require 'tls)
(require 'erc)
(require 'erc-highlight-nicknames)
(require 'smart-mode-line)
(require 'hungry-delete)
(require 'google-this)
(require 'clj-refactor)

;; Custom Setup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(eclim-eclipse-dirs (quote ("~/Downloads/eclipse")))
 '(eclim-executable "~/Downloads/eclipse/eclim")
 '(erc-port 6697)
 '(erc-server "ircs.amazon.com")
 '(org-hide-leading-stars t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'sml/replacer-regexp-list '("^~/development/" ":DEV:") t)

;; Modes
(key-chord-mode 1)
(window-numbering-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(global-eclim-mode)
(winner-mode 1)
(global-company-mode t)
(global-hungry-delete-mode)
(google-this-mode 1)

;; Alias
(defalias 'perl-mode 'cperl-mode)

;; Global keys
;; Found these great global key bindings at endlessparentheses.com
;; mnemonic, "Emacs toggle column", C-x t c
(define-prefix-command 'endless/toggle-map)
(define-key ctl-x-map "t" 'endless/toggle-map)

(define-key endless/toggle-map "c" #'column-number-mode)
(define-key endless/toggle-map "d" #'toggle-debug-on-error)
(define-key endless/toggle-map "e" #'toggle-debug-on-error)
(define-key endless/toggle-map "f" #'auto-fill-mode)
(define-key endless/toggle-map "l" #'toggle-truncate-lines)
(define-key endless/toggle-map "q" #'toggle-debug-on-quit)
(define-key endless/toggle-map "t" #'endless/toggle-theme)
;;; Generalized version of `read-only-mode'.
(define-key endless/toggle-map "r" #'dired-toggle-read-only)
(autoload 'dired-toggle-read-only "dired" nil t)
(define-key endless/toggle-map "w" #'whitespace-mode)

;; More from endless, say "Emacs launch calc", C-x l c
(define-prefix-command 'launcher-map)
;; C-x l is `count-lines-page' by default. If you
;; use that, you can try s-l or <C-return>.
(define-key ctl-x-map "l" 'launcher-map)
(global-set-key (kbd "s-l") 'launcher-map)
(define-key launcher-map "c" #'calc)
(define-key launcher-map "d" #'ediff-buffers)
(define-key launcher-map "f" #'find-dired)
(define-key launcher-map "g" #'lgrep)
(define-key launcher-map "G" #'rgrep)
(define-key launcher-map "h" #'man) ; Help
(define-key launcher-map "n" #'nethack)
(define-key launcher-map "l" #'paradox-list-packages)
(define-key launcher-map "s" #'eshell)
(define-key launcher-map "t" #'proced) ; top

;; Key chord bindings
;; faster shift
(key-chord-define-global "1q" "!")
(key-chord-define-global "2w" "@")
(key-chord-define-global "3e" "#")
(key-chord-define-global "4r" "$")
(key-chord-define-global "5t" "%")
(key-chord-define-global "6y" "^")
(key-chord-define-global "7u" "&")
(key-chord-define-global "8i" "*")
(key-chord-define-global "9o" "(")
(key-chord-define-global "0p" ")")
;; Ace jump
(key-chord-define-global "aj" 'ace-jump-mode)
;; Magit
(key-chord-define-global "ms" 'magit-status)


(defmacro run (exec)
  "Return a function that runs the executable EXEC."
  (let ((func-name (intern (concat "endless/run-" exec))))
    `(progn
       (defun ,func-name ()
         ,(format "Run the %s executable." exec)
         (interactive)
         (start-process "" nil ,exec))
       ',func-name)))

;; (define-key launcher-map "v" (run "steam"))
(define-key launcher-map "e" (run "eclipse"))
(define-key launcher-map "p" (run "pidgin"))
(define-key launcher-map "s" (run "spotify"))

(defmacro browse (url)
  "Return a function that calls `browse-url' on URL."
  (let ((func-name (intern (concat "endless/browse-" url))))
    `(progn
       (defun ,func-name ()
         ,(format "Browse to the url %s." url)
         (interactive)
         (browse-url ,url))
       ',func-name)))

(define-key launcher-map "r" (browse "http://www.reddit.com/r/emacs/"))
(define-key launcher-map "w" (browse "http://www.emacswiki.org/"))
(define-key launcher-map "?" (browse "http://emacs.stackexchange.com/"))
(define-key launcher-map "a" (browse "http://www.penny-arcade.com/"))
(define-key launcher-map "x" (browse "http://www.xkcd.com/"))
(define-key launcher-map "m" (browse "http://www.gizmag.com/"))
(define-key launcher-map "g" (browse "http://www.gmail.com/"))


;; Some global bindings I found from mastering emacs blog
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map (kbd "RET") 'newline-and-indent)

(load-file "~/.emacs.d/themes/almost-monokai.el")
(color-theme-almost-monokai)

(setq paradox-github-token '0af38642de4c23e8399e7849d875a7118308f322)

(set-face-attribute 'default nil :height 110)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Org
(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files "~/org" "\.org$"))
(setq org-default-notes-file "~/org/refile.org")

(setq org-capture-templates
    '(("t" "Todo" entry (file+headline "~/org/agenda.org" "Tasks")
       "* TODO %?\n")))

(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((ignore-errors (org-edit-src-code))
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))

(define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

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

(defun tr/java-self-insert-complete (char)
  (lexical-let ((char char))
    (lambda ()
      (interactive)
      (insert char)
      (company-complete))))

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
  (local-set-key (kbd "C-c z") 'eclim-java-implement)
  (local-set-key (kbd ".") (tr/java-self-inserg-complete ".")))

(fset 'emphasize-buffer
   "\C-u16\C-x}")
(global-set-key [f5] 'emphasize-buffer)

(add-hook 'java-mode-hook 'java-mode-keys)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;; ERC
(add-to-list 'erc-modules 'highlight-nicknames)
(erc-update-modules)
(erc-spelling-mode 1)
(setq erc-autojoin-channels-list '(("amazon.com" "#ingestion")))

(defun start-irc ()
  "Connect to IRC."
  (interactive)
  (erc-tls :server "ircs.amazon.com" :port 6697
	   :nick "trrogers" :full-name "trrogers"))

(add-hook 'erc-insert-post-hook
	  (lambda () (goto-char (point-min))
	    (when (re-search-forward
		   (regexp-quote (erc-current-nick)) nil t) (ding))))

;; Perl
;; (-each '(flycheck-mode linum-mode) (lambda (mode) (add-hook 'perl-mode-hook mode)))

;; Smart mode line
(sml/setup)
(sml/apply-theme 'powerline)
(add-to-list 'rm-excluded-modes '(google-this-mode company-mode))


;; CLJ Refactor
(add-hook 'clojore-mode-hook
	  (lambda()
	    (clj-refactor-mode 1)
	    (local-unset-key (kbd "C-m"))
	    (cljr-add-keybindings-with-prefix "C-c m")
	    ))

