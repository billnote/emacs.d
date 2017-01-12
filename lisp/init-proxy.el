;;; init-proxy.el --- Summary
;;; Commentary:
;;; proxy setting
;;; Code:

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\|192.*\\|127.0.0.1\\)")
        ("http" . "192.168.100.216:8080")
        ("https" . "192.168.100.216:8080")))

(provide 'init-proxy)
;;; init-proxy.el ends here
