(use-package haskell-mode :ensure t)
(use-package intero :ensure t)
(use-package popup :ensure t)
(use-package shm :ensure t)
(use-package hlint-refactor :ensure t)

(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'auto-revert-mode)

(setq haskell-stylish-on-save t)
(setq haskell-hasktags-path "haskdogs")
(setq haskell-tags-on-save t)

;(require 'shm)
;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;(set-face-background 'shm-current-face "white")
;(set-face-background 'shm-quarantine-face "white")

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; heist templates are html
;(add-to-list 'auto-mode-alist '("[.]tpl$" . web-mode))
