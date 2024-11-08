;; add melpa packages to package manager
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; load custom file wich is emacs configures (using customize-* commands)
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)
(package-install-selected-packages)

;; Appearance
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode)
(set-face-attribute 'default nil :height 200)

;; ido is for completion in the minibuffer
(require 'smex)
(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'global-tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; lsp support
(setq lsp-keymap-prefix "s-l")

(require 'lsp-mode)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'after-init-hook 'global-company-mode)

;; git controll
(require 'magit)


