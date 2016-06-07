(use-package tuareg :ensure t)
(use-package merlin :ensure t)
(use-package ocp-indent :ensure t)

(if (executable-find "opam")
    (progn (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
           (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

           (setq opam-bin (substring (shell-command-to-string "opam config var bin 2> /dev/null") 0 -1))
           (setenv "PATH" (concat (getenv "PATH") ":" opam-bin))
           (setq exec-path (append exec-path '(opam-bin)))))

;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
;; Enable auto-complete
; (setq merlin-use-auto-complete-mode 'easy)
;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)

(require 'ocp-indent)

(add-to-list 'company-backends 'merlin-company-backend)
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
