;;; my-defuns --- My personnal function

;;; Commentary:

;;; Code:

;; (require 'dash)

(defun recursive-list-files (directory)
  "Recursively list files in DIRECTORY.
The returned list is a list of absolute path."
  (setq files-list (directory-files directory t "[^.]$"))
  (-flatten (loop for path in files-list collect
                  (cond ((file-directory-p path)
                         (recursive-list-files path))
                        (path)))))

(defun setup-links (directory)
  "Link all files in DIRECTORY will be linked in ~."
  (interactive "DDirectory to look for files to link in \"~\": ")
  (let ((links-directory (expand-file-name directory)))
    (dolist (target (recursive-list-files links-directory))
      (let ((path
             (concat (expand-file-name "~") "/"
                     (substring target (length links-directory)))))
        (make-directory (file-name-directory path) t)
        (make-symbolic-link target path t)))))

(provide 'my-defuns)
;;; my-defuns.el ends here
