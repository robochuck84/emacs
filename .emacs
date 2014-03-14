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
(package-initialize)

(require 'cl)
(require 'eclim)
(global-eclim-mode)
(add-to-list 'eclim-eclipse-dirs "C:/Users/trrogers/My\ Documents/eclipse/eclipse")
(setq eclim-executable "C:/Users/trrogers/Documents/eclipse/eclipse/plugins/org.eclim_2.3.2/bin/eclim")

(require 'company)
(require 'company-emacs-eclim)

(setq company-backends
      (cons 'company-emacs-eclim (remove 'company-eclim
					 company-backends)))

(global-company-mode t)

(global-set-key "\C-cl" 'org-store-link) 
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cp" 'eclim-manage-projects)


(setq erc-autojoin-channels-alist
      '(("amazon.com" "#ingestion")))
(erc :server "irc.amazon.com" :port 6667 :nick "trrogers")

(require 'dirtree)
(add-to-list 'load-path "~/.emacs.d")
(load "line-num.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'discover)
(global-discover-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
