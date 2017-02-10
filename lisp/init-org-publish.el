;;; init-org-publish.el -- org publish
;;; Commentary:
;;; Code:
;;; (require 'org-publish)

(setq org-publish-project-alist
      '(
        ;;; mplus wiki setting
        ("m-html"
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
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|mp3\\|swf\\|zip\\|gz\\|txt"
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
        ("g-static"
         :base-directory "/home/bill.huang/documents/m/server/wiki/org"
         :publishing-directory "/home/bill.huang/workspace/Documents/server/sources"
         :recursive t
         :base-extension "tex\\|org\\|css\\|js\\|png\\|jpg\\|gif\\|mp3\\|swf\\|zip\\|gz\\|txt\\|json\\|uml\\|xml\\|java"
         :publishing-function org-publish-attachment)
        ("g-pdf"
         :base-directory "/home/bill.huang/documents/m/server/wiki/pdf"
         :publishing-directory "/home/bill.huang/workspace/Documents/server"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt"
         :publishing-function org-publish-attachment)
        ("mwiki"
         :components ("m-html" "m-static" "m-pdf" "g-static" "g-pdf")
         :author "bill.huang@mplusmedia.com")

        ;;; my blogs setting
        ("blog-html"
         :base-directory "/home/bill.huang/documents/mymind/org"
         :publishing-directory "/home/bill.huang/documents/mymind/blog"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "sitemap"
         :sitemap-sort-folders "last"
         :html-head-extra "<link rel=\"alternate\" type=\"application/rss+xml\"
                href=\"http://billhuang.me/sitemap.xml\"
                title=\"RSS feed for billhuang.me\">")
        ("blog-rss"
         :base-directory "/home/bill.huang/documents/mymind/org"
         :publishing-directory "/home/bill.huang/documents/mymind/blog"
         :base-extension "org"
         :publishing-function org-rss-publish-to-rss
         :html-link-home "http://billhuang.me/"
         :exclude ".*"
         :include ("sitemap.org"))
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
         :components ("blog-html" "blog-rss" "blog-static" "blog-sources")
         :author "billyhuang@sina.cn")))

(provide 'init-org-publish)
;;; init-org-publish ends here
