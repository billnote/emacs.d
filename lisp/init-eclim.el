;;; init-eclim.el --- Summary
;;; Commentary:
;;; init eclim
;;; Code:

(require-package 'emacs-eclim)
(require-package 'smartscan)
(require-package 'ggtags)
(require-package 'idle-highlight-mode)

(require 'eclim)
(require 'eclimd )
(global-eclim-mode)

(setq eclim-auto-save t ;; You *need* to have this one
      eclim-executable "~/tools/eclipse/eclim" ;; Where the eclim installation is in
      eclimd-default-workspace "~/workspace/.ads" ;; Eclipse workspace
      eclim-use-yasnippet nil
      eclimd-wait-for-process nil
      eclim-autoupdate-problems nil
      help-at-pt-display-when-idle t
      help-at-pt-timer-delay 0.5)

(help-at-pt-set-timer)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; Add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)

(define-key global-map "\C-ce" 'start-eclimd)

(defun my-java-mode-hook ()
  (auto-fill-mode)
  (ggtags-mode)
  ;;  (flyspell-prog-mode) ;; grabs C-; :(
  ;;  (flymake-mode)
  (eclim-mode)
  (subword-mode)
  (yas-minor-mode)
  (smartscan-mode)
  (idle-highlight-mode)

  ;; Only include eclim candidates in the completion menu, must be run
  ;; after eclim-mode above.
  (setq ac-sources '(ac-source-emacs-eclim))

  (define-key c-mode-base-map (kbd "C-S-o") 'eclim-java-import-organize)
  (define-key c-mode-base-map (kbd "C-S-e") 'eclim-problems-show-errors)
  (define-key c-mode-base-map (kbd "C-S-w") 'eclim-problems-show-warnings)
  (define-key c-mode-base-map (kbd "C-m") 'c-context-line-break)
  (define-key c-mode-base-map (kbd "C-q") 'eclim-java-show-documentation-for-current-element)
  (define-key c-mode-base-map (kbd "M-RET") 'eclim-problems-correct)
  (define-key c-mode-base-map (kbd "M-m") 'eclim-java-find-references)
  (define-key c-mode-base-map (kbd "M-i") 'eclim-java-implement) ;; IDEA is C-i
  (define-key c-mode-base-map (kbd "M-e") 'eclim-problems)
  (define-key c-mode-base-map (kbd "M-.") 'eclim-java-find-declaration)

  (define-key c-mode-base-map (kbd "S-M-r") 'eclim-java-refactor-rename-symbol-at-point)
  (define-key c-mode-base-map (kbd "S-<f7>") 'gtags-find-tag-from-here)

  (define-key c-mode-base-map (kbd "<f7>") 'gud-step)
  (define-key c-mode-base-map (kbd "<f8>") 'gud-next)
  (define-key c-mode-base-map (kbd "<f9>") 'gud-cont)

  ;; Fix indentation for anonymous classes
  (c-set-offset 'substatement-open 0)
  (if (assoc 'inexpr-class c-offsets-alist)
      (c-set-offset 'inexpr-class 0))

  ;; Indent arguments on the next line as indented body.
  (c-set-offset 'arglist-intro '+))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(defun my-java-before-save-hook()
  (when (eq major-mode 'java-mode)
    (eclim-problems-show-errors)))
(add-hook 'before-save-hook 'my-java-before-save-hook)

(provide 'init-eclim)
;;; init-eclim.el ends here
