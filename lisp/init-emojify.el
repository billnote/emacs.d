;;; init-emojify.el --- Summary
;;; Commentary:
;;; emojify config
;;; Code:

(require-package 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)

(provide 'init-emojify)
;;; init-emojify.el ends here
