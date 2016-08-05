;;; ... my-modes.el --- customize the language mode emacs dissplays ...

;;; ... matlab mode ...
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
(setq matlab-auto-fill nil)
(custom-set-variables
 '(matlab-shell-command-switches '("-nodesktop -nosplash")))
;;; ................... 

(provide 'my-modes)