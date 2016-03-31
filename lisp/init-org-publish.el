;;; init-org-publish.el -- org publish
;;; Commentary:
;;; Code:
;;; (require 'org-publish)

(setq org-publish-project-alist
      '(
        ;;; mplus wiki setting
        ("m-org"
         :base-directory "/home/bill.huang/documents/m/server/wiki/org"
         :publishing-directory "/home/bill.huang/documents/m/server/wiki/html"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "sitemap"
         :sitemap-sort-folders "last")
        ("m-static"
         :base-directory "/home/bill.huang/documents/m/server/wiki/org"
         :publishing-directory "/home/bill.huang/documents/m/server/wiki/html"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt"
         :publishing-function org-publish-attachment)
        ("m-pdf"
         :base-directory "/home/bill.huang/documents/m/server/wiki/org"
         :publishing-directory "/home/bill.huang/documents/m/server/wiki/pdf"
         :base-extension "org"
         :recursive t
         :publishing-function org-latex-publish-to-pdf
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "sitemap"
         :sitemap-sort-folders "last"
         )
        ("mwiki"
         :components ("dmj-org" "dmj-static" "dmj-pdf")
         :author "bill.huang@adchina.com")

        ;;; my blogs setting
        ("blog-org"
         :base-directory "/home/bill.huang/documents/mymind/org"
         :publishing-directory "/home/bill.huang/documents/mymind/blog"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "sitemap"
         :sitemap-sort-folders "last")
        ("blog-static"
         :base-directory "/home/bill.huang/documents/mymind/org"
         :publishing-directory "/home/bill.huang/documents/mymind/blog"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|svg\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("blog-sources"
         :base-directory "/home/bill.huang/documents/mymind/org"
         :publishing-directory "/home/bill.huang/documents/mymind/blog/sources"
         :recursive t
         :base-extension "dot\\|org\\|java"
         :publishing-function org-publish-attachment)
        ("blog"
         :components ("blog-org" "blog-static" "blog-sources")
         :author "billyhuang@sina.cn")))

(provide 'init-org-publish)
;;; init-org-publish ends here
