;;; init-dot.el --- Summary
;;; Commentary:
;;; dot config
;;; Code:

(require-package 'graphviz-dot-mode)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

(provide 'init-dot)
;;; init-dot.el ends here
