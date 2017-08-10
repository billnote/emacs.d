;;; init-icons.el --- Summary
;;; Commentary:
;;; all-the-icons config
;;; Code:

(require-package 'all-the-icons)
(require 'all-the-icons)

(all-the-icons-octicon "file-binary")  ;; GitHub Octicon for Binary File
(all-the-icons-faicon  "cogs")         ;; FontAwesome icon for cogs
(all-the-icons-wicon   "tornado")      ;; Weather Icon for tornado

(provide 'init-icons)
;;; init-icons.el ends here
