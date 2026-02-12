;;;; defaults

;;; Disable GUI elements; I don't want to use them.
(menu-bar-mode -1)   ; Disable the menu bar.
(tool-bar-mode -1)   ; Disable the toolbar.
(scroll-bar-mode -1) ; Disable visible scrollbar.
(tooltip-mode -1)    ; Disable tooltips.
(fset 'menu-bar-open nil)

;;; Move customization variables to a separate file and load it.
(setq custom-file (expand-file-name "custom-vars.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" .  "https://melpa.org/packages/") t)
(package-refresh-contents 'async)

(add-to-list 'default-frame-alist
	     '(font . "dejavusansmono-12"))

;;; Set some defaults.
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

;;; backup files go to "~/.config/.saves"
(setq backup-directory-alist '(("." . "~/.config/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

(blink-cursor-mode 0)  ; Disable cursor blink.
(electric-pair-mode t) ; Enable automatic brackets pairing.
(column-number-mode t) ; show cloumn numbers in modline.
(fido-mode 1)          ; Enable fido-mode

(add-hook 'prog-mode-hook (lambda ()
			    (setq display-line-numbers 'relative)))

;;;; use-package declarations

(use-package hl-line
  :hook
  ((prog-mode . hl-line-mode)
   (text-mode . hl-line-mode)))

(use-package dired
  :custom 
  (dired-listing-switches "-agho --ignore-backups --group-directories-first")
  (dired-dwim-target t)
  (dired-isearch-filenames t))

(use-package emacs
  :init
  (require-theme 'modus-themes)
  :config
  (setq modus-themes-common-palette-overrides
	'((docstring green-faint)
          (docmarkup magenta-faint)
	  (comment yellow-cooler)
          (string green-cooler)))
  (modus-themes-load-theme 'modus-operandi)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (add-to-list 'slime-contribs 'slime-autodoc))

(use-package geiser-guile
  :ensure t)

(use-package clhs
  :ensure t
  :config
  (load
   (concat (getenv "HOME") "/quicklisp/clhs-use-local.el") t))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c i"	.	mc/edit-lines)
	 ("C->"		.	mc/mark-next-like-this)
	 ("C-<"		.	mc/mark-previous-like-this)
	 ("C-c C-<"	.	mc/mark-all-like-this)
	 ("C-c C->"	.	mc/mark-all-dwim)))

(use-package company
  :ensure t
  :hook
  ((prog-mode . company-mode)
   (text-mode . company-mode)))

(use-package magit
  :ensure t)

(use-package rainbow-mode
  :ensure t)

;;;; elfeed

;;; TODO: This function needs lots of work, maybe use `start-process'
;;; instead of call-process-shell-command.
(defun elfeed-open-in-mpv ()
  "Open a elfeed entry in mpv."
  (interactive)
  (setq link (elfeed-search-selected :single))
  (if link
      (call-process-shell-command
       (concat "mpv " (elfeed-entry-link link) " &") nil 0)
    (message "ERROR: nothing selected"))
  (elfeed-search-untag-all-unread))

(use-package elfeed
  :defer t
  :ensure t
  :bind (("C-c r" . elfeed)
	 ("C-c m" . elfeed-open-in-mpv))
  :custom
  (elfeed-db-directory (concat user-emacs-directory "/.elfeed"))
  :config
  (elfeed-search-set-filter "@1-months-ago +unread -emacs")

  (add-hook 'elfeed-new-entry-hook
	    (elfeed-make-tagger :before "4 weeks ago"
				:remove 'unread))
  (setq elfeed-feeds
	;; The last Youtubers I'm thinking of are still worth watching.
	'(;; Diesel Creek
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCBB0oz7Yo_35gnbPYGKGJTA" youtube)
	  ;; Scrappy Industries
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCyacDPsLkX-KDqYMZPpmtDQ" youtube)
	  ;; Skote Outdoors (This guys have a life time.)
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCXiH_m2Bqew7JZ8pv84xbow" youtube)
	  ;; Welker Farms
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCtKUW8LJK2Ev8hUy9ZG_PPA" youtube)
	  ;; Tsoding
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCrqM0Ym_NbK1fqeQG2VIohg" youtube)
	  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCEbYhDd6c6vngsF5PQpFVWg" youtube)
	  ;; Blogs
	  ("https://planet.emacslife.com/atom.xml" emacs)
	  ("https://suckless.org/atom.xml" blog))))

;;;; global key bindings

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
