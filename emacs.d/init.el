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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/home/dbp/code/oplss/agda-stdlib-0.9/src/")))
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(company-show-info t)
 '(completion-ignored-extensions
   (quote
    (".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".hi" ".dyn_hi" ".dyn_o")))
 '(css-indent-offset 2)
 '(cursor-color "#657b83")
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default)))
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(foreground-color "#657b83")
 '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
 '(global-linum-mode t)
 '(haskell-hoogle-command "hoogle")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-type (quote cabal-repl))
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-source-type (quote file-line) t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-search-library-in-sexp t)
 '(helm-locate-command "locate %s -e -A %s")
 '(helm-mode t)
 '(helm-move-to-line-cycle-in-source t)
 '(helm-quick-update t)
 '(helm-scroll-amount 8)
 '(helm-split-window-in-side-p t)
 '(inferior-haskell-wait-and-jump t)
 '(lpr-command "gpr")
 '(magit-use-overlays nil)
 '(mm-text-html-renderer (quote w3m))
 '(org-agenda-files
   (quote
    ("~/annex/todos/school.org" "~/annex/todos/jacobin.org")))
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . fundamental)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("haskell-simple" . haskell))))
 '(package-enable-at-startup t)
 '(robe-completing-read-func (quote helm-robe-completing-read))
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (TeX-command-extra-options . "-shell-escape")
     (flycheck-ghc-search-path "/home/dbp/code/thistle/src")
     (flycheck-ghc-package-databases "/home/dbp/code/thistle/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d/")
     (flycheck-ghc-search-path "/home/dbp/code/skilltree/src")
     (flycheck-ghc-package-databases "/home/dbp/code/skilltree/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d/")
     (flycheck-ghc-search-path "/home/dbp/code/migrate/src")
     (flycheck-ghc-package-databases "/home/dbp/code/migrate/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d/")
     (flycheck-ghc-search-path "/home/dbp/code/snap-testing/src")
     (flycheck-ghc-package-databases "/home/dbp/code/snap-testing/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d/")
     (flycheck-ghc-search-path "/home/dbp/code/pcori/src")
     (flycheck-ghc-no-user-package-database . t)
     (flycheck-ghc-package-databases "/home/dbp/code/pcori/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d/")
     (haml-indent-offset . 4)
     (auto-fill-mode . 1))))
 '(sml/battery-format "%p ")
 '(sml/replacer-regexp-list
   (quote
    (("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/code/pyret-lang/" ":PT:")
     ("^~/code/captain-teach/" ":CT:"))))
 '(type-break-good-rest-interval 300)
 '(type-break-interval 1800)
 '(type-break-keystroke-threshold (quote (525 . 2625))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection-line ((t (:background "navajo white" :underline t)))))
