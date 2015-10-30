(use-package inf-ruby :ensure t)
(use-package robe :ensure t)
(use-package rspec-mode :ensure t)
(use-package company-inf-ruby :ensure t)
(use-package scss-mode :ensure t)
(use-package haml-mode :ensure t)
(use-package rvm :ensure t)

(setq scss-compile-at-save nil)

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))


(eval-after-load 'inf-ruby
  '(define-key inf-ruby-minor-mode-map
     (kbd "C-c C-s") 'inf-ruby-console-auto))

;; NOTE(dbp 2015-04-27): If zeus isn't running when you first run a spec,
;; rspec-mode will erroneously use SPEC=ttt style command with zeus, which
;; will break.
(setq rspec-use-rake-when-possible nil)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'ruby-mode-hook 'robe-mode)

;; http://emacs.stackexchange.com/questions/3537/how-do-you-run-pry-from-emacs
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
