;;; init-mu4e.el --- Summary
;;; Commentary:
;;; mu4e configure
;;; Code:

(add-to-list 'load-path "~/.emacs.d/site-lisp/mu4e")

(require-package 'smtpmail-multi)

(require 'mu4e)
(require 'smtpmail-multi)
(require 'smtpmail)
(require 'org-mu4e)

;; path to our Maildir directory
(setq mu4e-maildir "~/Maildir")

;; the next are relative to `mu4e-maildir'
;; instead of strings, they can be functions too, see
;; their docstring or the chapter 'Dynamic folders'
(setq mu4e-sent-folder   "/Sent Messages"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder  "/Junk")

;; the maildirs you use frequently; access them with 'j' ('jump')
(setq   mu4e-maildir-shortcuts
        '(("/archive"     . ?a)
          ("/inbox"       . ?i)
          ("/work"        . ?w)
          ("/Sent Messages"        . ?s)))

;; a  list of user's e-mail addresses
(setq mu4e-user-mail-address-list '("qing.xie@mplusmedia.cn" "micheal.gao@mplusmedia.cn"))

;; when you want to use some external command for text->html
;; conversion, e.g. the 'html2text' program
;; (setq mu4e-html2text-command "html2text")

;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
;; These are the defaults:
(setq mu4e-headers-fields
      '( (:date          .  12)    ;; alternatively, use :human-date
         (:flags         .   6)
         (:from          .  22)
         (:subject       .  nil))) ;; alternatively, use :thread-subject

;; program to get mail; alternatives are 'fetchmail', 'getmail'
;; isync or your own shellscript. called when 'U' is pressed in
;; main view.

;; If you get your mail without an explicit command,
;; use "true" for the command (this is the default)
(setq
 mu4e-get-mail-command "offlineimap"
 mu4e-update-interval 1800)

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq user-mail-address "bill.huang@mplusmedia.cn"
      user-full-name  "Bill.Huang")
(setq mu4e-compose-signature
      "Bill.Huang\nhttp://www.mplusmedia.cn\n")

;; smtp mail setting
(setq smtpmail-multi-accounts
      (quote
       ((mplus . ("bill.huang@mplusmedia.cn"
                  "smtp.exmail.qq.com"
                  465
                  "bill.huang@mplusmedia.cn"
                  starttls
                  nil nil nil)))))
(setq smtpmail-multi-associations
      (quote
       (("bill.huang@mplusmedia.cn" mplus)
        )))

(setq smtpmail-multi-default-account (quote mplus))

(setq
 message-send-mail-function 'smtpmail-send-it
 smtpmail-auth-credentials "~/.authinfo.gpg"
 smtpmail-starttls-credentials '(("smtp.exmail.qq.com" 465 nil "~/Maildir/exmail.qq.com.crt"))
 smtpmail-default-smtp-server "smtp.exmail.qq.com"
 smtpmail-smtp-server "smtp.exmail.qq.com"
 smtpmail-local-domain "exmail.qq.com"

 ;; if you need offline mode, set these -- and create the queue dir
 ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Maildir/queue
 smtpmail-queue-mail  nil
 smtpmail-queue-dir  "/home/user/Maildir/queue/cur")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq mu4e-view-show-images t)

(provide 'init-mu4e)
;;; init-mu4e.el ends here
