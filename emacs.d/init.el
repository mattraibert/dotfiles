(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/urweb-mode/")
(load "urweb-mode-startup")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'uniquify)
(defconst required-packages
  '(multi-web-mode
    find-file-in-repository
    multiple-cursors
    highlight-symbol
    smex
    haskell-mode
    flycheck
    flycheck-haskell
    flx-ido))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(if (window-system) (set-frame-size (selected-frame) 142 41))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 20)
 '(auto-save-timeout 1)
 '(auto-save-visited-file-name t)
 '(blink-matching-paren t)
 '(blink-matching-paren-distance nil)
 '(blink-matching-paren-on-screen nil)
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" default)))
 '(display-time-day-and-date t)
 '(display-time-mode t)
 '(flx-ido-mode t)
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(haskell-hoogle-command "~/.cabal/bin/hoogle")
 '(haskell-mode-hook
   (quote
    (capitalized-words-mode highlight-symbol-mode flycheck-mode)))
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(highlight-symbol-idle-delay 0.2)
 '(ido-auto-merge-delay-time 100000)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(multi-web-global-mode t nil (multi-web-mode))
 '(mweb-default-major-mode (quote html-mode))
 '(mweb-filename-extensions (quote ("htm" "html" "tpl")))
 '(mweb-tags
   (quote
    ((js-mode "<script.*>" "</script>")
     (css-mode "<style.*>" "</style>"))))
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(show-trailing-whitespace t)
 '(standard-indent 2)
 '(tags-case-fold-search nil)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)

(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'flycheck)
(eval-after-load 'flycheck '(require 'flycheck-haskell))
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'highlight-symbol-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
(add-to-list 'load-path "~/.emacs.d/structured-haskell-mode/elisp/")
(require 'shm)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(set-face-background 'shm-current-face "#eee8d5")
(set-face-background 'shm-quarantine-face "lemonchiffon")
(define-key shm-map (kbd "M-DEL") 'shm/delete)
(define-key shm-map (kbd "<C-backspace>") 'shm/delete)
(require 'find-file-in-repository)
(global-set-key (kbd "C-x f") 'find-file-in-repository)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

;; handle auto-commenting better by rebinding C-; to comment/uncomment
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(defun todo ()
  "Insert a new dated TODO comment"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (end-of-line)
  (insert (format-time-string "TODO(mjr %Y-%m-%d): "))
  (comment-or-uncomment-region-or-line)
  (previous-line)
  (end-of-line)
  )

(defun note ()
  "Insert a new dated NOTE comment"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (end-of-line)
  (insert (format-time-string "NOTE(mjr %Y-%m-%d): "))
  (comment-or-uncomment-region-or-line)
  (previous-line)
  (end-of-line)
  )

(define-key haskell-mode-map (kbd "C-c C-h") 'hoogle)

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

(setenv "PATH" (concat "~/.cabal/bin:" (getenv "PATH")))
(add-to-list 'exec-path "~/.cabal/bin")


(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
  ;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)
