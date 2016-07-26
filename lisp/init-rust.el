;;; init-rust.el --- Summary
;;; Commentary:
;;; init rust mode
;;; Code:

(require-package 'rust-mode)
(require-package 'rustfmt)
(require-package 'racer)
(require-package 'company)
(require-package 'company-racer)
(require-package 'flycheck)
(require-package 'flycheck-rust)

(setq company-idle-delay 0.2)
(setq racer-cmd "~/.cargo/bin/racer")
(setq racer-rust-src-path "~/workspace/rust-projects/rust/src")

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'rust-mode-hook                                                   ;;
;;           '(lambda ()                                                            ;;
;;              ;; Enable racer                                                ;;
;;              (racer-activate)                                               ;;
;;              ;; Hook in racer with eldoc to provide documentation           ;;
;;              (racer-turn-on-eldoc)                                          ;;
;;              ;; Use flycheck-rust in rust-mode                              ;;
;;              (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)           ;;
;;              ;; Use company-racer in rust mode                              ;;
;;              (set (make-local-variable 'company-backends) '(company-racer)) ;;
;;              ;; Key binding to jump to method definition                    ;;
;;              (local-set-key (kbd "M-.") #'racer-find-definition)            ;;
;;              ;; Key binding to auto complete and indent                     ;;
;;              (local-set-key (kbd "TAB") #'racer-complete-or-indent)))       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'init-rust)
;;; init-rust.el ends here
