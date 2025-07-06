;;; init.el --- Personal emacs init.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" .  "https://melpa.org/packages/") t)
(package-refresh-contents 'async)

;; list of packages
(setq package-selected-packages '(elfeed
				  multiple-cursors
				  move-text
				  magit
				  company
				  emms
				  slime
				  slime-company
				  nasm-mode
				  org-bullets
				  org-appear
				  all-the-icons-dired
				  pinentry))
(package-install-selected-packages t)

(add-to-list 'load-path
	     (expand-file-name "extra" user-emacs-directory))

(require 'init-dired)
(require 'init-theme)
(require 'init-company-mode)
(require 'init-elfeed)
(require 'init-emms)
(require 'init-eshell)
(require 'init-org)
(require 'init-flyspell)

(blink-cursor-mode 0)  ; Disable cursor blink.
(electric-pair-mode t) ; Enable automatic brackets pairing.
(column-number-mode t) ; show cloumn numbers in modline.

(add-to-list 'default-frame-alist
	     '(font . "dejavusansmono-14"))

(setq backup-directory-alist '(("." . "~/.config/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

(fido-mode 1)

(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook 'display-fill-column-indicator-mode)

(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'text-mode-hook 'hl-line-mode)

(add-hook 'prog-mode-hook (lambda ()
			    (setq display-line-numbers 'relative)))


(when (package-installed-p 'pinentry)
  (setq epa-pinentry-mode 'loopback)
  (pinentry-start))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c RET")  'compile)

(global-set-key (kbd "M-<up>")   'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "M-n")      'move-text-down)
(global-set-key (kbd "M-p")      'move-text-up)

(global-set-key (kbd "C-c i")    'mc/edit-lines)
(global-set-key (kbd "C->")      'mc/mark-next-like-this)
(global-set-key (kbd "C-<" )     'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")  'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->" ) 'mc/mark-all-dwim)

;;; init.el ends here
