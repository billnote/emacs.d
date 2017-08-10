;;; init-nodejs.el --- Summary
;;; Commentary:
;;; config node.js develop env
;;; Code:
(require-package 'tern)
(require-package 'tern-auto-complete)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))
(eval-after-load 'context-coloring
  '(tern-context-coloring-setup))

(provide 'init-nodejs)
;;; init-nodejs.el ends here
