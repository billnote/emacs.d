;;; init-wp-blog.el --- Summary
;;; Commentary:
;;; init wordpress blog config
;;; Code:

(require-package 'xml-rpc)
(require-package 'metaweblog)
(require-package 'org2blog)

(let (credentials)
  ;; only required if your auth file is not already in the list of auth-sources
  (add-to-list 'auth-sources "~/.authinfo.gpg")
  (setq credentials (auth-source-user-and-password "myblog"))
  (setq org2blog/wp-blog-alist
        `(("my-blog"
           :url "http://billhuang.me/xmlrpc.php"
           :username ,(car credentials)
           :password ,(cadr credentials)))))

(provide 'init-wp-blog)
;;; init-wp-blog.el ends here
