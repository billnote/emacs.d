;;; init-my-org.el --- Summary
;;; Commentary:
;;; org project config
;;; Code:
(require-package 'org-plus-contrib)
(require-package 'gnuplot-mode)

(setq org-agenda-files (list "~/.todo/" "~/.todo/.bill/"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("u" "UnionPay AdServer" entry (file+headline "~/.todo/projects.org" "Yellowstone AdServer") "* TODO %? %^g\n %i" :prepend t)
        ("p" "PMP AdServer" entry (file+headline "~/.todo/projects.org" "PMP AdServer") "* TODO %? %^g\n %i")
        ("w" "PMP Web" entry (file+headline "~/.todo/projects.org" "PMP Web") "* TODO %? %^g\n %i")
        ("t" "Tracking Server" entry (file+headline "~/.todo/projects.org" "Tracking Server") "* TODO %? %^g\n %i")
        ("c" "Cookie Mapping" entry (file+headline "~/.todo/projects.org" "Cookie Mapping Server") "* TODO %? %^g\n %i")
        ("r" "Report" entry (file+headline "~/.todo/projects.org" "Report") "* TODO %? %^g\n %i")
        ("m" "UPM Access" entry (file+headline "~/.todo/projects.org" "UPM Access") "* TODO %? %^g\n %i")
        ("o" "Other Task" entry (file+headline "~/.todo/projects.org" "Other Task") "* TODO %? %^g\n %i")
        ("i" "Idea" entry (file+headline "~/.todo/task.org" "Ideas") "* TODO %? %^g\n %i" :prepend t)
        ("j" "Task" entry (file+headline "~/.todo/task.org" "Tasks") "* TODO %? %^g\n %i" :prepend t)
        ("n" "Note" entry (file+headline "~/.todo/note.org" "Notes") "* %U %?\n\n %i" :prepend t :empty-lines 1)
        ("a" "Account" table-line (file+headline "~/.account/.account.org.gpg" "bill accounts") "| %? | %? | %? | %U |")))
(setq org-agenda-include-diary t)

(setq org-agenda-custom-commands
      '(("A" "PRIORITY A"
         ((tags-todo "+PRIORITY=\"A\""))
         ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block
        ("B" "PRIORITY B"
         ((tags-todo "+PRIORITY=\"B\""))
         ((org-agenda-compact-blocks t)))
        ("C" "PRIORITY C"
         ((tags-todo "+PRIORITY=\"C\""))
         ((org-agenda-compact-blocks t)))
        ))

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
   (gnuplot . t )
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

;; refile hook
;; (add-hook 'org-afterf-refile-insert-hook #'org-update-parent-todo-statistics)

(provide 'init-my-org)

;;; init-my-org.el ends here
