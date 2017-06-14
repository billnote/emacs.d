;;; init-plantuml.el --- Summary
;;; Commentary:
;;; plantuml config
;;; Code:
(require-package 'plantuml-mode)

(setq plantuml-jar-path "~/.emacs.d/tools/plantuml/plantuml.jar")
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
