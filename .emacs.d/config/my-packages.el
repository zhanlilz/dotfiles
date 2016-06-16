;;; my-settings --- My packages-specific settings

;;; Commentary:

;; These are all settings concerning elpa or git packges (those in
;; packages-dir).

;;; Code:

;;;; From packages dir

;; (require 'undo-tree)
;; (setq undo-tree-auto-save-history t
;;       undo-tree-history-directory-alist
;;       `((".*" . ,(expand-file-name "tmp" user-emacs-directory))))
;; (global-undo-tree-mode)

;; (require 'bongo)

;;;; (M)Elpa pachages

;; set markdown-command for markdown-mode and markdown-preview-mode
;; (setq markdown-command "python -m markdown -o 'html5' -x markdown.extensions.codehilite -x markdown.extensions.toc")

;; (require 'magit)

;; (require 'flycheck)
;; (global-flycheck-mode)

(provide 'my-packages)
;;; my-packages.el ends here
