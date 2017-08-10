;;; init-mode-line.el --- Summary
;;; Commentary:
;;; use smart-mode-line and powerline
;;; Code:
(require-package 'use-package)
(require-package 'powerline)
(require-package 'spaceline)
(require-package 'spaceline-all-the-icons)
(require-package 'fancy-battery)
(require-package 'yahoo-weather)
;; (require-package 'smart-mode-line)
;; (require-package 'smart-mode-line-powerline-theme)
;; (require 'smart-mode-line-solarized-powerline-theme)

;; (setq sml/theme 'solarized-powerline)
;; (setq sml/theme 'powerline)
;; (sml/setup)

;; (add-to-list 'sml/replacer-regexp-list '("^~/workspace/java-projects/AdServer/" ":ADS:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/workspace/rust-projects/" ":RUSTPJ:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/documents/m/server/wiki" ":MWiki:"))

(require 'use-package)
(require 'spaceline-config)
(require 'fancy-battery)
(require 'yahoo-weather)

(yahoo-weather-mode)
(fancy-battery-mode)

(use-package spaceline-all-the-icons
  :after spaceline
  :config
  (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
  (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
  (setq spaceline-all-the-icons-separator-type 'wave)
  (spaceline-all-the-icons-theme)
  (spaceline-toggle-all-the-icons-buffer-position-on)
  (spaceline-toggle-all-the-icons-hud-on)
  (spaceline-toggle-all-the-icons-battery-status-on)
  (spaceline-toggle-all-the-icons-weather-on))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
