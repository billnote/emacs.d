;;; init-local.el --- Summary
;;; Commentary:
;;; my custom config
;;; Code:

;;; open debugss
;; (setq debug-on-error t)
;;; use china Mirror
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org" . "http://elpa.emacs-china.org/org/")))

;;; performance for flycheck
(with-eval-after-load 'flycheck
  (advice-add 'flycheck-eslint-config-exists-p :override (lambda() t)))

(require 'init-linum)
(require 'init-scheme)
(require 'init-yasnippet)
(require 'init-my-org)
(require 'init-org-publish)
(require 'init-org-to-pdf)
(require 'init-rust)
(require 'init-mu4e)
;; (require 'init-eclim)
;; (require 'init-hydra)
(require 'init-srspeedbar)
(require 'init-tabbar)
(require 'protobuf-mode)
(require 'init-eima)
(require 'init-my-sql)
(require 'init-thrift)
(require 'init-keybinding)
(require 'init-wp-blog)
(require 'init-go)
(require 'init-plantuml)
(require 'init-emojify)
(require 'init-chinese-font)
(require 'init-dot)
(require 'init-nodejs)
(require 'init-icons)
(require 'init-mode-line)
(require 'init-neotree)

;; set fonts
;;(add-to-list 'default-frame-alist '(font . "Fira Code-10"))
;;(set-face-attribute 'default t :font "Fira Code-10")

(provide 'init-local)
;;; init-local.el ends here
