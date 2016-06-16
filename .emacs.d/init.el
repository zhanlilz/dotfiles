;;; init --- Zhan Li's main init file for emacs
;;; Adapted from https://github.com/sshbio/dot/blob/master/emacs.d/init.el

;; This init file loads all other init files for custome configurations.
;; .emacs.d
;; ├── config ;; custome configuration lisp files
;; │   ├── modes ;; lisp files for language highlighting modes
;; │   ├── my-alias.el
;; │   ├── my-appearance.el
;; │   ├── my-config.el
;; │   ├── my-customs.el
;; │   ├── my-defuns.el
;; │   ├── my-emms.el
;; │   ├── my-eshell.el
;; │   ├── my-keys.el
;; │   └── my-packages.el
;; ├── elisp ;; user's own lisp files
;; │   └── linum-highligth-current-line-number.el
;; ├── init.el
;; ├── packages ;; user's installed lisp packages


(setq user-full-name "Zhan Li"
      user-mail-address "zhanli1986@gmail.com")


;;; set specific init files
(setq-default
 ;; custom config init files
 custom-file
 (expand-file-name "config/my-custom.el" user-emacs-directory))


;;; set load directories
(defvar config-dir
 (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path config-dir)
(defvar elisp-dir
 (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path elisp-dir)
(defvar elpa-dir
 (expand-file-name "elpa" user-emacs-directory))
(add-to-list 'load-path elpa-dir)

;; Packages
(defvar packages-dir
 (expand-file-name "packages" user-emacs-directory))
(add-to-list 'load-path packages-dir)
(dolist (package (directory-files packages-dir t "\\w+"))
  (when (file-directory-p package)
    (add-to-list 'load-path package)))


;;; Load config
(require 'my-appearance)
(require 'my-config)
(require 'my-alias)
(require 'my-defuns)
(require 'my-keys)
(require 'my-eshell)
(require 'my-emms)


;;; Install (m)elpa packages
(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                        )
)
(defvar package-list
  '(
;;    flycheck
;;    markdown-preview-mode
;;    websocket
;;    markdown-mode
;;    cl-lib
    ))
(package-initialize)
(dolist (package package-list)
  (unless (package-installed-p package)
    (unless package-archive-contents (package-refresh-contents))
    (package-install package)
  )
)


;;; Load packages
(require 'my-packages)


(provide 'init)
;;; init.el ends here
