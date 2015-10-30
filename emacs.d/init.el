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
(load "~/.emacs.d/config/languages/haskell.el")
(load "~/.emacs.d/config/languages/ocaml.el")
(load "~/.emacs.d/config/languages/ruby.el")
(load "~/.emacs.d/config/languages/web.el")
(load "~/.emacs.d/config/languages/proof.el")
