(require 'package)
(package-initialize)

(if (window-system) (set-frame-size (selected-frame) 140 40))

(add-to-list 'package-archives  '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes (quote ("90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" default)))
 '(ido-mode (quote both) nil (ido)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; autosave/revert
(setq auto-save-interval 20)
(setq auto-save-timeout 3)
(setq auto-save-visited-file-name t)
(setq global-auto-revert-mode t)
(setq make-backup-files nil)

;; modeline/linum/startup/bars
(setq column-number-mode t)
(setq custom-enabled-themes (quote (adwaita)))
(setq display-time-day-and-date t)
(setq display-time-mode t)
(setq global-linum-mode t)
(setq size-indication-mode t)
(setq inhibit-startup-screen t)
(setq linum-format " %3i ")
(setq menu-bar-mode nil)
(setq tool-bar-mode nil)

;; ido/smex/recentf
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;;(setq ido-mode 1)
(setq flx-ido-mode 1) 
(setq ido-use-filename-at-point (quote guess))

(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(add-hook 'haskell-mode-hook 'flycheck-mode)
