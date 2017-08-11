;;; init-mode-line.el --- Summary
;;; Commentary:
;;; use smart-mode-line and powerline
;;; Code:
(require-package 'use-package)
(require-package 'git-gutter)
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
(require 'git-gutter)

q;; (require 'my-spaceline-all-the-icons)
(yahoo-weather-mode)
(fancy-battery-mode)
;; (use-package spaceline :after powerline
;;   :config (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati)))))

(global-git-gutter-mode t)
(custom-set-variables
 ;; '(git-gutter:update-interval 2)
 '(git-gutter:window-width 2)
 '(git-gutter:modified-sign "☁")
 '(git-gutter:added-sign "☀")
 '(git-gutter:deleted-sign "☂"))

(setq inhibit-compacting-font-caches t)
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
  (spaceline-toggle-all-the-icons-weather-on)
  (spaceline-toggle-all-the-icons-git-status-on)
  (spaceline-toggle-all-the-icons-flycheck-status-on)
  (spaceline-toggle-all-the-icons-flycheck-status-info-on))

(provide 'init-mode-line)
;;; init-mode-line.el ends here
