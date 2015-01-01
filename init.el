(package-initialize nil)

(add-to-list 'load-path "~/.emacs.d")

(package-initialize t)

(setq package-enable-at-startup nil)

(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/robo-babel.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "8f7e1668dd3a097964e6016c26d36822ab2e48fc3e9a3a2e2634224a5ca728c8" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(eclim-eclipse-dirs (quote ("~/Downloads/eclipse")))
 '(eclim-executable "~/Downloads/eclipse/eclim")
 '(org-agenda-files (quote ("/home/local/ANT/trrogers/org/agenda.org" "/home/local/ANT/trrogers/org/refile.org" "/home/local/ANT/trrogers/org/project_notes.org" "/home/local/ANT/trrogers/org/phonescreens/ovidiu_tirsa.org" "/home/local/ANT/trrogers/org/phonescreens/questions.org" "/home/local/ANT/trrogers/org/ticket_notes.org" "/home/local/ANT/trrogers/org/emacs.org")))
 '(org-hide-leading-stars t)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
