(use-package web-mode :ensure t)
(setq js-indent-level 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; require mode for urweb
(if (file-directory-p "~/dropbox/config/urweb-mode")
    (progn
      (add-to-list 'load-path "~/dropbox/config/urweb-mode")
      (load "urweb-mode-startup")
      ))


;; lss files are (close enough to) css
(add-to-list 'auto-mode-alist '("[.]lss$" . css-mode))
