;;; my-config --- My plain emacs settings without package

;;; Commentary:

;; These settings may not require any external packages: pure emacs
;; settings.

;;; Code:

(require 'server)
(unless (server-running-p) (server-start))


;;;; Variables

(setq-default

 ;; Startup
 inhibit-startup-message t
 initial-scratch-message nil
 frame-resize-pixelwise t

 ;; interface
 echo-keystrokes 0.1
 visible-bell t
 doc-view-resolution 200
 use-dialog-box nil
 ruler-mode-current-column-char ?.
 icomplete-separator "  "
 icomplete-prospects-height 1
 completion-show-help nil

 ;; Content
 indent-tabs-mode nil
 whitespace-style '(face empty tabs)
 whitespace-line-column 70
 dired-listing-switches "-alh --group-directories-first"

 ;; Backups and autosaves in ~/.emacs.d/tmp
 backup-directory-alist '((".*" . "~/.emacs.d/tmp"))
 auto-save-file-name-transforms '((".*" "~/.emacs.d/tmp" t)))

;; ;; Replace characters used in terminal mode
;; (set-display-table-slot standard-display-table
;;                         'vertical-border (make-glyph-code ?│))


;;;; Modes

(add-hook 'find-file-hook(lambda () (ruler-mode 1) (linum-mode t)))
(show-paren-mode t)
(global-hl-line-mode -1)
(line-number-mode 0)
(global-whitespace-mode t)
(dynamic-completion-mode t)
(icomplete-mode 1)
;; (subword-mode 1)

;; disable auto indentation
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;;;;;;;;;;;;;;;;;;;;
;;; set up unicode
;;(prefer-coding-system       'utf-8)
;;(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(setq default-buffer-file-coding-system 'utf-8)                      
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


(provide 'my-config)
;;; my-config.el ends here
