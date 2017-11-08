;; -*- mode: emacs-lisp -*- ;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(load "~/.emacs.d/config/global.el")
(load "~/.emacs.d/config/autosave.el")
(load "~/.emacs.d/config/projectile.el")
(load "~/.emacs.d/config/haskell.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(js-indent-level 2)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key
 (kbd "C-x C-c")
 (lambda ()
   (interactive)
   (save-some-buffers t)
   (kill-this-buffer)
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lower-frame)
   (iconify-frame)))

(global-set-key (kbd "M-<right>") 'right-word)
(global-set-key (kbd "M-<left>") 'left-word)
