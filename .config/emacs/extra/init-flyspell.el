;;; init-flyspell.el --- flyspell Configuration file -*- lexical-binding: t -*-

(require 'flyspell)

(defun toggle-flyspell-mode ()
  "If in a `prog-mode' enable `flyspell-prog-mode' if in a
 `text-mode' enable `flyspell-mode'.
Enable `flyspell-mode' if it's not enabled, disable
`flyspell-mode' if it's enabled."
  (interactive)
  (cond ((derived-mode-p 'prog-mode)
	 (if (equal flyspell-mode nil)
	     (progn
	       (flyspell-prog-mode)
	       (message "flyspell-prog-mode enabled"))
	   (progn
	     (flyspell-mode-off)
	     (message "flyspell-prog-mode disabled"))))
	((derived-mode-p 'text-mode)
	 (if (equal flyspell-mode nil)
	     (progn  
	       (flyspell-mode)
	       (message "flyspell-mode enabled"))
	   (progn  
	     (flyspell-mode-off)
	     (message "flyspell-mode disabled"))))))

(setq ispell-local-dictionary "en_US")

(add-hook 'flyspell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c d") 'ispell-change-dictionary)))

(global-set-key (kbd "C-c s") 'toggle-flyspell-mode)

(provide 'init-flyspell)

;;; init-flyspell.el ends here
