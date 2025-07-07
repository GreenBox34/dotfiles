;;; init-eshell.el --- Eshell Configuration file -*- lexical-binding: t -*-

(require 'eshell)
(require 'em-alias)

(defun eshell-prompt ()
  "My custome eshell prompt."
  (let ((current-dir (abbreviate-file-name default-directory)))
    (concat
     (propertize current-dir 'face '(:foreground "#79a8ff" :weight bold))
     (propertize " λ"        'face '(:foreground "#ff8059" :weight bold))
     " ")))

;; shell aliases
(eshell/alias "ff" "find-file $1")
(eshell/alias "d" "dired $1")
(eshell/alias "cal" "calendar")
(eshell/alias "la" "ls -ah")
(eshell/alias "ll" "ls -ahl")
(eshell/alias "c" "clear-scrollback")

(setq eshell-prompt-regexp "^[^#λ\n]*[#λ] ")
(setq eshell-prompt-function 'eshell-prompt
      eshell-prefer-lisp-functions t)

(global-set-key (kbd "C-x e") 'eshell)

(provide 'init-eshell)

;;; init-eshell.el ends here
