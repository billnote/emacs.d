;;; init-my-sql.el --- Summary
;;; Commentary:
;;; my sql config
;;; Code:

(setq sql-connection-alist
      '((local-mtd (sql-product 'mysql)
                   (sql-port 3306)
                   (sql-server "192.168.100.212")
                   (sql-user "root")
                   (sql-database "mtd"))
        (aws-mtd (sql-product 'mysql)
                 (sql-port 3306)
                 (sql-server "prodmobile.cvtolksdye1l.rds.cn-north-1.amazonaws.com.cn")
                 (sql-user "mobile_user")
                 (sql-database "mtd"))))

(defun my-sql-connect (product connection)
  ;; load the password
  (load-file "../my-password.el.gpg")

  ;; update the password to the sql-connection-alist
  (let ((connection-info (assoc connection sql-connection-alist))
        (sql-password (car (last (assoc connection my-sql-password)))))
    (delete sql-password connection-info)
    (nconc connection-info `((sql-password ,sql-password)))
    (setq sql-connection-alist (assq-delete-all connection sql-connection-alist))
    (add-to-list 'sql-connection-alist connection-info))

  ;; connect to database
  (setq sql-product product)
  (sql-connect connection))

(defun my-sql-local ()
  (interactive)
  (my-sql-connect 'postgres 'local-mtd))

(defun my-sql-aws ()
  (interactive)
  (my-sql-connect 'postgres 'aws-mtd))
(provide 'init-my-sql)
;;; init-my-sql.el ends here
