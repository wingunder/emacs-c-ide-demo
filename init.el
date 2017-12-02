;;; package --- emacsinit:
;;; Commentary:
(require 'package)
;;; Code:
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(zenburn-theme zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:background "black" :foreground "green"))))
 '(magit-diff-added-highlight ((t (:background "black" :foreground "green"))))
 '(magit-diff-base ((t (:background "black" :foreground "yellow"))))
 '(magit-diff-base-highlight ((t (:background "black" :foreground "yellow"))))
 '(magit-diff-lines-heading ((t (:inherit magit-diff-hunk-heading-highlight :background "black" :foreground "green"))))
 '(magit-diff-removed ((t (:background "black" :foreground "red"))))
 '(magit-diff-removed-highlight ((t (:background "black" :foreground "red")))))

(global-set-key (kbd "C-x g") 'magit-status)

(require 'expand-region)
(global-set-key (kbd "M-2") 'er/expand-region)

(require 'ido)
(ido-mode t)

(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; enable recent files mode.
(recentf-mode t)

;; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(setq inhibit-splash-screen t)

(setq prelude-guru nil)
(normal-erase-is-backspace-mode 0)
(delete-selection-mode 1)
(transient-mark-mode 1)
(setq shift-selection-mode 1)

(column-number-mode 1)
(setq display-time-24hr-format t)
(display-time-mode 1)

;(setq scroll-preserve-screen-position 1)
;(setq kill-ring-max 5)
(setq bookmark-save-flag 1)
(setq show-trailing-whitespace t)
(setq indicate-empty-lines 1)
;(setq scroll-conservatively 0)

; Don't backup!
(setq make-backup-files nil)
(setq auto-save-mode 0)

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode 0)
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)
;;;(setq tab-always-indent 1)
;;(setq indent-tabs-mode 1)
;;(setq standard-indent 4)
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
;;  ;; Your init file should contain only one such instance.
;; '(tab-width 4))

;(setq tab-width 4)

(global-flycheck-mode)
(setq flycheck-emacs-lisp-load-path 'inherit)

;;; Function Key maps
(global-set-key [f3] 'revert-buffer)
;(global-set-key [f4] 'speedbar-get-focus)
(global-set-key [f7] 'goto-line)
(global-set-key [f9] 'compile)

;;; Desktop saving
(desktop-save-mode 1)

; Key bindings, when using GNU screen.
;(define-key global-map [?\e ?\[ ?2 ?\; ?2 ?~] [S-insert])
(define-key global-map [?\e ?\[ ?3 ?\; ?2 ?z] [S-delete])
(define-key global-map [?\e ?\[ ?2 ?\; ?5 ?z] [C-insert])
(define-key global-map [?\e ?\[ ?3 ?\; ?5 ?z] [C-delete])

(define-key global-map [?\e ?\[ ?2 ?2 ?2 ?z] [next])
(define-key global-map [?\e ?\[ ?2 ?1 ?6 ?z] [prior])

(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?A] [S-up])
(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?B] [S-down])
(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?C] [S-right])
(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?D] [S-left])
(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?F] [S-end])
;(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?G] [S-next])
(define-key global-map [?\e ?\[ ?1 ?\; ?2 ?H] [S-home])

(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?A] [C-S-up])
(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?B] [C-S-down])
(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?C] [C-S-right])
(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?D] [C-S-left])
;(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?E] [C-S-prior])
(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?H] [C-S-home])
(define-key global-map [?\e ?\[ ?1 ?\; ?6 ?F] [C-S-end])

(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?A] [C-up])
(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?B] [C-down])
(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?C] [C-right])
(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?D] [C-left])
(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?H] [C-home])
(define-key global-map [?\e ?\[ ?1 ?\; ?5 ?F] [C-end])
;(define-key global-map [?\e ?\[ ?5 ?\; ?5 ?~] [C-prior])
;(define-key global-map [?\e ?\[ ?6 ?\; ?5 ?~] [C-next])

;;; init.el ends here
