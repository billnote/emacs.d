;;; init-mode-line.el --- Summary
;;; Commentary:
;;; use smart-mode-line and powerline
;;; Code:
(require-package 'smart-mode-line)
(require 'smart-mode-line-solarized-powerline-theme)

(setq sml/theme 'solarized-powerline)
(sml/setup)



(add-to-list 'sml/replacer-regexp-list '("^~/workspace/java-projects/AdServer/" ":ADS:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/workspace/rust-projects/" ":RUSTPJ:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/documents/m/server/wiki" ":MWiki:"))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
