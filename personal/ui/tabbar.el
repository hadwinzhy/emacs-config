;;; package --- Summary

;;; Commentary:
;; My Prelude configuration for Personal.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-packages '(tabbar))

(require 'tabbar)
(tabbar-mode t)
(tabbar-mwheel-mode -1)

(setq
 tabbar-scroll-left-help-function nil   ;don't show help information
 tabbar-scroll-right-help-function nil
 tabbar-help-on-tab-function nil
 tabbar-home-help-function nil
 tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
 tabbar-scroll-left-button (quote (("") ""))
 tabbar-scroll-right-button (quote (("") ""))
 )

(setq tabbar-separator '(1))

(defconst red "#607000")
(defconst darkblue "#071e26")

(set-face-attribute 'tabbar-default nil
                    :background darkblue
                    :foreground darkblue
                    )

(set-face-attribute 'tabbar-unselected nil
                    :foreground red
                    :background darkblue
                    :box nil)
(set-face-attribute 'tabbar-selected nil
                    :foreground darkblue
                    :background red
                    :box nil)

(set-face-attribute 'tabbar-button nil
                    :box nil)


(defun switch-tabbar (num)
  (let* ((tabs (tabbar-tabs
                (tabbar-current-tabset)
                ))
         (tab (nth
               (if (> num 0) (- num 1) (+ (length tabs) num))
               tabs)))
    (if tab (switch-to-buffer (car tab)))))

(global-set-key (kbd "M-1") (lambda () (interactive) (switch-tabbar 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (switch-tabbar 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (switch-tabbar 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (switch-tabbar 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (switch-tabbar 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (switch-tabbar 6)))
(global-set-key (kbd "M-7") (lambda () (interactive) (switch-tabbar 7)))
(global-set-key (kbd "M-8") (lambda () (interactive) (switch-tabbar 8)))
(global-set-key (kbd "M-9") (lambda () (interactive) (switch-tabbar 9)))
(global-set-key (kbd "M-0") (lambda () (interactive) (switch-tabbar 10)))

(global-set-key (kbd "M-]")  'tabbar-forward-tab)
(global-set-key (kbd "M-[")  'tabbar-backward-tab)
(global-set-key (kbd "M-\-") 'tabbar-backward-group)
(global-set-key (kbd "M-=")  'tabbar-forward-group)

;;;;;;;;;;;;;;;;;;;;;Tab Group devide;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;group 1: shell or other process
;;group 2: emacs buffer, like "Message"
;;group 3: the file which I opened it
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
         ;; Check if the major mode derives from `comint-mode' or
         ;; `compilation-mode'.
         (tabbar-buffer-mode-derived-p
          major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    (t
     "User Buffer"
     ))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;;; tabbar.el ends here
