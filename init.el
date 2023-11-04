(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(setq initial-major-mode 'org-mode)

(setq custom-file (locate-user-emacs-file "custom.el"))

(menu-bar-mode 1)
(tool-bar-mode -1)
(context-menu-mode 1)

(set-face-attribute 'default nil :family "SF Pro" :height 200)

(setq-default line-spacing 5)

(setq-default cursor-type '(bar . 3))
(set-cursor-color "#007AFF")

(global-hl-line-mode 1)
(set-face-background 'hl-line "#EEF4FF")

(setq inhibit-startup-message t)
(setq warning-minimum-level :emergency)

(setq mac-command-modifier 'meta)
(setq next-line-add-newlines t)

(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 8)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 8)))

(setq-default mode-line-format nil)

(set-face-attribute 'region nil :background "#B3D7FF")

(setq initial-scratch-message nil)

(use-package spacious-padding
  :init
  (spacious-padding-mode 1))

(use-package expand-region)

(require 'expand-region)
(global-set-key (kbd "C-l") 'er/expand-region)
(global-set-key (kbd "C-;") 'er/contract-region)

(defun copy-whole-buffer ()
  "Copy the entire buffer to the clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max))
  (message "Buffer copied to clipboard"))

(global-set-key (kbd "M-C") 'copy-whole-buffer)

(delete-selection-mode 1)

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-hide-emphasis-markers t)

(global-visual-line-mode 1)
