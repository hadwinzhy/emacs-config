;;; package --- Summary

;;; Commentary:
;; My Prelude configuration for Personal.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Enhance JS2 Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

'(js2-highlight-unused-variables-mode 1)
'(js2-highlight-level 3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; JSX Mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;; js.el ends here
