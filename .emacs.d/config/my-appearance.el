;;; my-appearance --- My emacs appearance: theme, font, no GUI...

;;; Commentary:

;; This file is the only one that is loaded by (load-file "%"), since
;; it require to be loaded at the very beginning of emacs starting

;;; Code:


;;;; Theme

;; (load-theme 'quasi-monochrome t)
;; (load-theme 'my t)


;;;; GUI

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'fringe-mode) (fringe-mode 0))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;;;; Font

;; (set-frame-font "-*-Terminus-*-*-*-*-16-*-*-*-*-*-*-*")
;; (add-to-list 'default-frame-alist
;;              '(font . "-*-Terminus-*-*-*-*-16-*-*-*-*-*-*-*"))


;;;; Faces

;; Colorize minibuffer while active
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (make-local-variable 'face-remapping-alist)
            (add-to-list 'face-remapping-alist
                         '(default (:inherit mode-line)))))

;; Highlight current line number
;; (load "linum-highligth-current-line-number.el")
;; (set-face-foreground 'highlight nil)

(defface my-linum-hl
  `((t :background ,(face-foreground 'default)
       :foreground ,(face-background 'default)))
  "Face for the current line number."
  :group 'linum)

(defvar my-linum-current-line-number 0)

(defun my-linum-format (line-number)
  "Dynamically set the line number at LINE-NUMBER given."
  (propertize (format "%4d \u2502" line-number) 'face
              (if (eq line-number my-linum-current-line-number)
                  'my-linum-hl
                'linum)))

(setq-default linum-format 'my-linum-format)

(defadvice linum-update (around my-linum-update)
  "Update the line numbers while cursor move."
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))

(ad-activate 'linum-update)


(provide 'my-appearance)
;;; my-appearance.el ends here
