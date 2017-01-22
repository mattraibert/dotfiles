(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t)
(use-package highlight-parentheses :ensure t)
(use-package highlight-symbol :ensure t)
(use-package markdown-mode :ensure t)
(use-package popwin :ensure t)
(use-package smart-mode-line :ensure t)
(use-package smex :ensure t)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(display-time-mode)
(auto-compression-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(setq-default indent-tabs-mode nil)

(setq highlight-symbol-idle-delay 0.2)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

(require 'popwin)
(popwin-mode 1)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(recentf-mode)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)
