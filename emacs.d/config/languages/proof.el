(if (file-exists-p "/home/dbp/code/proofgeneral")
    (load-file "/home/dbp/code/proofgeneral/generic/proof-site.el")
  (if (file-exists-p "/usr/share/emacs24/site-lisp/proofgeneral")
      (load-file "/usr/share/emacs24/site-lisp/proofgeneral/generic/proof-site.el")
    (if (file-exists-p "/Users/dbp/code/proofgeneral")
        (load-file "/Users/dbp/code/proofgeneral/generic/proof-site.el"))))

(setq proof-splash-enable nil)

(setq coq-prog-args '("-R" "/Users/dbp/code/cpdt/src" "Cpdt"))

(eval-after-load "proof-script"
  '(progn
     (define-key proof-mode-map (kbd "C-c C-RET") 'proof-goto-point)
     ))

(add-hook 'proof-ready-for-assistant-hook (lambda () (show-paren-mode 0)))


(if (executable-find "agda-mode")
    (load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda-mode locate"))))

(use-package idris-mode :ensure t)
(use-package jonprl-mode :ensure t)
