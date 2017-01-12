;;; smart-mode-line-solarized-powerline-theme.el --- Summary
;;; Commentary:
;;; from https://github.com/Malabarba/smart-mode-line/blob/master/themes/smart-mode-line-powerline-theme.el
;;; Code:

(deftheme smart-mode-line-solarized-powerline
  "Powerline theme for smart-mode-line.
Mimics the appearance of powerline.")

(require 'powerline)

(set-face-attribute 'powerline-active1 nil :inherit 'sml/global)
(set-face-attribute 'powerline-active2 nil :inherit 'sml/global)

(let ((l0 "#4F4F4F")
      (l3 (or (face-background 'powerline-active1) "Grey30"))
      (l8 (or (face-background 'powerline-active2) "Grey80"))
      (separator-left
       '(intern (format "powerline-%s-%s"
                        (powerline-current-separator)
                        (car powerline-default-separator-dir))))
      (separator-right
       '(intern (format "powerline-%s-%s"
                        (powerline-current-separator)
                        (cdr powerline-default-separator-dir)))))
  (custom-theme-set-faces
   'smart-mode-line-solarized-powerline
   `(mode-line-buffer-id ((t :inherit sml/filename :foreground nil :background nil)))
   `(mode-line-inactive ((((background dark)) :foreground "gray60" :background "#8E8E8E"
                          :slant italic :box (:line-width -1 :color "#2aa198"))
                         (((background light)) :foreground "gray60" :background "#8E8E8E"
                          :slant italic :box (:line-width -1 :color "gray60"))))
   `(mode-line     ((t :foreground "#F0F0F0" :background ,l0 :box (:line-width -1 :color "#8E8E8E"))))
   `(sml/global    ((t :foreground "#F0F0F0" :background ,l0 :inverse-video nil)))

   ;; Layer 0
   `(sml/line-number         ((t :foreground "White" :inherit sml/global :weight bold :background ,l0)))
   `(sml/remote              ((t :inherit sml/global :background ,l0)))
   `(sml/col-number          ((t :inherit sml/global :background ,l0)))
   `(sml/numbers-separator   ((t :inherit sml/col-number :background ,l0)))
   `(sml/client              ((t :inherit sml/prefix :background ,l0)))
   `(sml/mule-info           ((t :inherit sml/global :background ,l0)))
   `(sml/not-modified        ((t :inherit sml/global :background ,l0)))
   '(sml/read-only           ((t :inherit sml/not-modified :foreground "Cyan")))

   ;; 3
   `(sml/prefix    ((t :background ,l3 :inherit sml/global :foreground "#bf6000")))
   `(sml/filename  ((t :background ,l3 :inherit sml/global :foreground "#cb4b16")))
   `(sml/sudo      ((t :background ,l3 :inherit sml/outside-modified)))
   `(sml/git       ((t :background ,l3 :inherit (sml/read-only sml/prefix))))
   `(sml/folder    ((t :background ,l3 :inherit sml/global :weight normal :foreground "#073642")))

   ;; 8
   `(sml/name-filling        ((t :background ,l8 :inherit sml/prefix :weight normal)))
   `(sml/position-percentage ((t :background ,l8 :inherit sml/prefix :weight normal :foreground "#330000")))
   `(sml/modes               ((t :background ,l8 :inherit sml/global :foreground "Black")))
   `(sml/process             ((t :background ,l8 :inherit sml/prefix)))
   `(sml/vc                  ((t :background ,l8 :inherit sml/git :foreground "#0000aa")))
   `(sml/vc-edited           ((t :background ,l8 :inherit sml/prefix :foreground "#330000")))

   ;; 3
   ;; minor modes
   `(sml/minor-modes         ((t :inherit sml/folder)))

   ;; 0
   `(sml/discharging         ((t :background ,l0 :inherit sml/global :foreground "Red")))
   `(sml/time                ((t :background ,l0 :inherit sml/global)))

   `(persp-selected-face ((t :foreground "ForestGreen" :inherit sml/filename)))
   `(helm-candidate-number ((t :foreground nil :background nil :inherit sml/filename))))
  (custom-theme-set-variables
   'smart-mode-line-solarized-powerline
   '(sml/mode-width (if (eq (powerline-current-separator) 'arrow) 'right 'full))
   `(sml/pre-id-separator
     '(""
       (:propertize " " face sml/global)
       (:eval (propertize " " 'display (funcall ,separator-left 'sml/global 'powerline-active1)))
       (:propertize " " face powerline-active1)))
   `(sml/pos-id-separator
     '(""
       (:propertize " " face powerline-active1)
       (:eval (propertize " " 'display (funcall ,separator-left 'powerline-active1 'powerline-active2)))
       (:propertize " " face powerline-active2)))
   `(sml/pre-minor-modes-separator
     '("" (:propertize " " face powerline-active2)
       (:eval (propertize " " 'display (funcall ,separator-right 'powerline-active2 'powerline-active1)))
       (:propertize " " face powerline-active1)))
   `(sml/pos-minor-modes-separator
     '("" (:propertize " " face powerline-active1)
       (:eval (propertize " " 'display (funcall ,separator-right 'powerline-active1 'sml/global)))
       (:propertize " " face sml/global)))
   '(sml/pre-modes-separator
     (propertize " " 'face 'sml/modes))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'smart-mode-line-solarized-powerline)
;;; smart-mode-line-solarized-powerline-theme.el ends here
