;;; init-local.el --- Summary
;;; Commentary:
;;; my custom config
;;; Code:

(require 'init-linum)
(require 'init-scheme)
(require 'init-my-org)
(require 'init-yasnippet)
(require 'init-org-publish)
(require 'init-org-to-pdf)
(require 'init-rust)
(require 'init-mu4e)
;; (require 'init-eclim)
(require 'init-hydra)
(require 'init-srspeedbar)
(require 'init-tabbar)
(require 'protobuf-mode)
(require 'init-eima)
(require 'init-my-sql)
(require 'init-thrift)
(require 'init-keybinding)
(require 'init-mode-line)
(require 'init-wp-blog)

;; set fonts
(add-to-list 'default-frame-alist '(font . "Fira Code-10"))
(set-face-attribute 'default t :font "Fira Code-10")

(provide 'init-local)
;;; init-local.el ends here
