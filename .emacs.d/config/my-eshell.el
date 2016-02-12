;;; my-eshell --- My eshell settings

;;; Commentary:

;;; Code:

(require 'eshell)
(require 'em-prompt)
(require 'em-term)
(require 'em-cmpl)
(require 'em-smart)


;;;; Variables

(setq
 eshell-where-to-jump 'begin
 eshell-review-quick-commands nil
 eshell-smart-space-goes-to-end t

 ;; Prompt
 eshell-prompt-function
 (lambda ()
   (concat "\n┌───┤" (format-time-string "%H:%M" (current-time))
           "├───┤ " (abbreviate-file-name (eshell/pwd))
           "\n▒ "))
 eshell-prompt-regexp  "^[^▒]*▒ ")

(add-to-list 'eshell-visual-commands "alsamixer cfdisk")

(add-hook 'eshell-mode-hook 'eshell-smart-initialize)


(provide 'my-eshell)
;;; my-eshell.el ends here
