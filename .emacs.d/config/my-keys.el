;;; my-keys --- My custom keybindings

;;; Commentary:

;;; Code:

;; Launch windows
(global-set-key (kbd "C-x t") 'eshell)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-b") 'bs-show)

;; Space to complete instead of self inserting
(define-key minibuffer-local-filename-completion-map (kbd "SPC")
  'minibuffer-complete-word)

;; Switch windows with <S-arrow-keys>
(windmove-default-keybindings)

;; Browse the kill ring
(global-set-key (kbd "M-y") '(lambda () (interactive)
                               (tmm-prompt 'yank-menu)))

;; Completion
(global-set-key (kbd "M-/") 'hippie-expand)

(provide 'my-keys)
;;; my-keys.el ends here
