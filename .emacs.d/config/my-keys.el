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

;; check if this is the last emacs daemon client. If so, close emacs
;; daemon server
(defun kill-emacs-sever ()
  (interactive)
  (setq active-clients-or-frames ( or (> (length server-clients) 1)
                                      (> (length (frame-list)) 2)
                                             ))
  ; When displaying the number of clients and frames: 
  ; subtract 1 from the clients for this client.
  ; subtract 1 from the frames for this frame
  (when ( or (not active-clients-or-frames)
                    (yes-or-no-p (format "There are currently the other %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))
    ; If the user quits during the save dialog then don't exit emacs.
    ; Still close the terminal though.
    (let((inhibit-quit t))
      ; Save buffers
      (with-local-quit
          (save-some-buffers)) 

      (if quit-flag    
          (setq quit-flag nil)  
          ; Kill all remaining clients
          (progn
            (dolist (client server-clients)
              (server-delete-client client))
            ; Exit emacs
            (kill-emacs))
      )
    )
  )
)
(global-set-key (kbd "C-x C-c") 'kill-emacs-sever)

(provide 'my-keys)
;;; my-keys.el ends here
