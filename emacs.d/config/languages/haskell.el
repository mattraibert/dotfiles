(use-package haskell-mode :ensure t)
(use-package intero :ensure t)
(use-package popup :ensure t)

(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'company-mode)

(setq haskell-stylish-on-save t)

(if (file-directory-p "~/code/structured-haskell-mode/elisp")
    (progn
      (add-to-list 'load-path "~/code/structured-haskell-mode/elisp")
      (require 'shm)

      (add-hook 'haskell-mode-hook 'structured-haskell-mode)

      (set-face-background 'shm-current-face "#eee8d5")
      (set-face-background 'shm-quarantine-face "lemonchiffon")

      ;; NOTE(dbp 2014-11-07): overriding to get it to use helm. Not sure if there
      ;; is a better way to do this (racket's parametrize would be great!).
      (defun shm/yank-pop ()
        "Yank from the kill ring and insert indented with `shm-insert-indented'."
        (interactive)
        (shm-with-fallback
         helm-show-kill-ring
         (if (not (eq last-command 'yank))
             (error "Previous command was not a yank (error from shm/yank-pop)"))
         (shm-insert-indented #'yank-pop)))
      )
  (progn
    (add-hook 'haskell-mode-hook 'haskell-indentation-mode)))


;; heist templates are html
(add-to-list 'auto-mode-alist '("[.]tpl$" . web-mode))
