;;; package --- Summary

;;; Commentary:

(menu-bar-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Highlight ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-packages '(highlight-symbol))

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Mouse Smooth Scroll ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.02)
  (scroll-up increment) (sit-for 0.05)
  (scroll-up increment) (sit-for 0.06)
  (scroll-up increment))

(global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
(global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Key ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-l" 'goto-line)
;; use f5 to delete other windows, simpler than C-x 1
(global-set-key [f5] 'delete-other-windows)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Line Number ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prelude-require-packages '(hlinum))
(global-linum-mode t)
(hlinum-activate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Others ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq tab-width 4)
(setq fill-column 80)

(set-scroll-bar-mode nil) ;去掉滚动条，因为可以使用鼠标滚轮了 ^_^

(provide 'interface)

;;; interface.el ends here
