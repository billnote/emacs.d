;;; init-my-org.el --- Summary
;;; Commentary:
;;; org project config
;;; Code:
(require-package 'org-plus-contrib)

(setq org-agenda-files (list "~/.todo/" "~/.todo/.bill/"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("m" "m+server" entry (file+headline "~/.todo/projects.org" "Other Tasks") "* TODO %? %^g\n %i" :prepend t)
        ("d" "DMP Client" entry (file+headline "~/.todo/projects.org" "DMP Client") "* TODO %? %^g\n %i")
        ("p" "Publish Tool" entry (file+headline "~/.todo/project.org" "Publish Tool") "* TODO %? %^g\n %i")
        ("i" "Idea" entry (file+headline "~/.todo/task.org" "Ideas") "* TODO %? %^g\n %i" :prepend t)
        ("t" "Task" entry (file+headline "~/.todo/task.org" "Tasks") "* TODO %? %^g\n %i" :prepend t)
        ("n" "Note" entry (file+headline "~/.todo/note.org" "Notes") "* %U %?\n\n %i" :prepend t :empty-lines 1)
        ("u" "Account" table-line (file+headline "~/.account/.account.org.gpg" "bill accounts") "| %? | %? | %? | %U |")))
(setq org-agenda-include-diary t)

;;设置plantuml & dita
;;(require 'ob-plantuml)
(setq org-plantuml-jar-path "~/.emacs.d/tools/plantuml/plantuml.jar")
(setq org-ditaa-jar-path "~/.emacs.d/tools/ditaa/ditaa.jar")

;; 各种Babel语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (matlab . t)
   (C . t)
   (perl . t)
   (sh . t)
   (ditaa . t)
   (python . t)
   (haskell . t)
   (dot . t)
   (latex . t)
   (js . t)
   (java . t)
   (plantuml . t)
   ))

;;生成图像不提示
(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)

;;(setq org-export-with-sub-superscripts {})

;; org-mode color
(org-add-link-type
 "color" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<span style=\"color:%s;\">%s</span>" path desc))
    ((eq format 'latex)
     (format "{\\color{%s}%s}" path desc)))))
;; org-mode highlight
(org-add-link-type
 "hl" nil
 (lambda (path desc format)
   (cond
    ((eq format 'html)
     (format "<font style=\"background-color:%s;\">%s</font>" path desc))
    ((eq format 'latex)
     (format "\\colorbox{%s}{%s}" path desc))))) ;; require \usepackage{color}

(provide 'init-my-org)

;;; init-my-org.el ends here
