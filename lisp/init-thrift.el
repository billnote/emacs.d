;;; init-thrift.el --- Summary
;;; Commentary:
;;; init thrift config
;;; Code:

(require-package 'thrift)
(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode))

(provide 'init-thrift)
;;; init-thrift.el ends here
