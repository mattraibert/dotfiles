(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t)
(use-package highlight-parentheses :ensure t)
(use-package auto-highlight-symbol :ensure t)
(use-package markdown-mode :ensure t)
(use-package projectile :ensure t)
(use-package popwin :ensure t)
(use-package smart-mode-line :ensure t)

(projectile-global-mode)

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

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(setq ahs-idle-interval 0.2)

(require 'popwin)
(popwin-mode 1)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'ido)
(ido-mode t)
