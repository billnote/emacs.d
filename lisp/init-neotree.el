;;; init-neotree.el --- Summary
;;; Commentary:
;;; init neotree config
;;; Code:

(require-package 'neotree)
(require 'neotree)

(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-width 40)

(provide 'init-neotree)
;;; init-neotree.el ends here
