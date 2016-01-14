;;; init-rust.el --- Summary
;;; Commentary:
;;; init rust mode
;;; Code:

(require-package 'rust-mode)
(require-package 'rustfmt)
(require-package 'racer)
(require-package 'company)

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'init-rust)
;;; init-rust.el ends here
