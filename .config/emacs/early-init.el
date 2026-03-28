;;; early-init.el --- Personal Emacs configuration -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(menu-bar-mode -1)     ; Disable the menu bar.
(tool-bar-mode -1)     ; Disable the toolbar.
(scroll-bar-mode -1)   ; Disable visible scrollbar.
(blink-cursor-mode -1) ; Disable cursor blink
(tooltip-mode -1)      ; Disable tooltips.

(setq gc-cons-threshold 25000000)

;;; early-init.el ends here
