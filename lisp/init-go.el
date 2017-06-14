;;; init-go.el --- Summary
;;; Commentary:
;;; go lang config
;;; Code:

(require-package 'flymake-go)
(require-package 'go-errcheck)
(require-package 'go-mode)
(require-package 'go-eldoc)
(require-package 'go-snippets)
(require-package 'company-go)
(require-package 'go-autocomplete)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()  (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))

(add-hook 'flymake-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))

(provide 'init-go)
;;; init-go.el ends here
