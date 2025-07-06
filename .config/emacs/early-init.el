;;; early-init.el --- Personal early-init.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Set some defaults.
(setq inhibit-startup-screen t)     ; Disable the startup screen.
(setq use-short-answers t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq ring-bell-function nil)       ; Turn off bell.
(setq vc-follow-symlinks t)         ; Follow symlinks without requesting confirmation.
(setq confirm-kill-emacs 'y-or-n-p) ; Confirm before exiting Emacs.
(setq delete-by-moving-to-trash t)  ; Move deleted files to trash.
(setq vc-follow-symlinks t)         ; Follow symlinks without requesting confirmation.
(setq warning-minimum-level :error) ; Only show errors in *warning* buffer. (maybe not so good)

;; Disable GUI elements; I don't want to use them.
(menu-bar-mode -1)   ; Disable the menu bar.
(tool-bar-mode -1)   ; Disable the toolbar.
(scroll-bar-mode -1) ; Disable visible scrollbar.
(tooltip-mode -1)    ; Disable tooltips.
(fset 'menu-bar-open nil)

;; Move customization variables to a separate file and load it.
(setq custom-file (expand-file-name "custom-vars.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;;; early-init.el ends here
