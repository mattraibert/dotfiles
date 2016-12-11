(use-package haskell-mode :ensure t)
(use-package intero :ensure t)
(use-package popup :ensure t)
(use-package shm :ensure t)

(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'company-mode)

(setq haskell-stylish-on-save t)

(require 'shm)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)


;; heist templates are html
;(add-to-list 'auto-mode-alist '("[.]tpl$" . web-mode))
