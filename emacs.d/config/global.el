;; Global Packages
(use-package company :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t)
(use-package helm :ensure t)
(use-package helm-ag :ensure t)
(use-package helm-projectile :ensure t)
(use-package highlight-parentheses :ensure t)
(use-package highlight-symbol :ensure t)
(use-package magit :ensure t)
(use-package markdown-mode :ensure t)
(use-package multi-term :ensure t)
(use-package multiple-cursors :ensure t)
(use-package popwin :ensure t)
(use-package projectile :ensure t)
(use-package smart-mode-line :ensure t)
(use-package solarized-theme :ensure t)


;; Global Configuration
(projectile-global-mode)
(exec-path-from-shell-initialize)
(server-start)
(set-default-font "Inconsolata-20")
(setq multi-term-program-switches "--login")

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

; (type-break-mode)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(auto-compression-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
;; make buffers with the same file name use file:path/fragment to distinguish
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
;; don't use tabs, ever
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook '(lambda () (if (not (equal major-mode 'latex-mode)) (delete-trailing-whitespace))))
;; no backup file vomit
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(put 'downcase-region 'disabled nil)
(setq tramp-default-method "ssh")
(setq tramp-auto-save-directory "~/.tramp-autosave")
;(add-hook 'after-init-hook 'global-company-mode)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq highlight-symbol-idle-delay 0.2)
(setq global-linum-mode t)

;; Global bindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'helm-M-x)
;; return should indent as well
(global-set-key (kbd "RET") 'newline-and-indent)
;; this means you go to the beginning of the code, not the beginning of the line
(global-set-key (kbd "C-a") 'back-to-indentation)
; with shift, actually go to the beginning of line
(global-set-key (kbd "C-S-a") 'beginning-of-line)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key [M-up] 'move-line-up)
(global-set-key [M-down] 'move-line-down)


;; Color Theme
(defun solarized-toggle ()
  "Switch between solarized dark and light"
  (interactive)
  (if (eq dark-or-light 'light)
      (progn (setq dark-or-light 'dark)
             (load-theme 'solarized-dark t))
    (progn (setq dark-or-light 'light)
           (load-theme 'solarized-light t))))

(setq dark-or-light 'dark)
(solarized-toggle)

;; from http://www.emacswiki.org/emacs/ElispCookbook#toc6
(defun trim-whitespace (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'"
                       str)
    (setq str (replace-match "" t t str)))
  str)

;; uuids!
(defun uuid ()
  "Insert a random universally unique identifier (UUID)."
  (interactive)
  (insert (trim-whitespace (shell-command-to-string "uuidgen"))))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))


;; easily move text around, line by line; courtesy of
;; http://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs#answer-2425753
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))


;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(defun todo ()
  "Insert a new dated TODO comment"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (end-of-line)
  (insert (format-time-string "TODO(dbp %Y-%m-%d): "))
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
  (insert (format-time-string "NOTE(dbp %Y-%m-%d): "))
  (comment-or-uncomment-region-or-line)
  (previous-line)
  (end-of-line)
  )

(require 'helm-config)

(global-set-key (kbd "C-c g") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))

(defun projectile-helm-do-ag ()
  (interactive)
  (helm-do-ag (projectile-project-root)))

(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
; (setq helm-ag-command-option "")
(setq helm-ag-source-type 'file-line)
(setq projectile-switch-project-action 'helm-my-mini)

(helm-mode 1)
(require 'helm-projectile)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c g o") 'helm-occur)
(global-set-key (kbd "C-c g s") 'projectile-helm-do-ag)

(defun helm-my-mini ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer
     (if (eq nil (ignore-errors (projectile-project-root)))
         '(helm-source-buffers-list
           helm-source-recentf
           helm-source-files-in-current-dir
           helm-source-buffer-not-found)
       '(helm-source-projectile-buffers-list
         helm-source-projectile-recentf-list
         helm-source-projectile-files-list
         helm-source-buffers-list
         helm-source-recentf
         helm-source-buffer-not-found))
     "*helm-my-mini*")))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-my-mini)
;; NOTE(dbp 2015-10-22): Because it's super annoying to accidentally hold down the C.
(global-set-key (kbd "C-x C-b") 'helm-my-mini)

(require 'popwin)
(popwin-mode 1)
