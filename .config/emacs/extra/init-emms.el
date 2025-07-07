;;; init-emms.el --- EMMS Configuration file -*- lexical-binding: t -*-

(require 'emms-source-file)
(require 'emms-source-playlist)

(defcustom playlists-path "~/Music/playlists/"
  "Path for playlists used by `play-playlist' function."
  :type 'string)

(defun play-playlist ()
  "This function first sets `emms-source-file-default-directory'
 to `playlists-path' and than `emms-play-playlist' interactively."
  (interactive)
  (emms-stop)
  (setq emms-source-file-default-directory playlists-path)
  (call-interactively 'emms-play-playlist)
  (emms-playlist-mode-go))

(defcustom just-play-path "~/Music/"
  "Path for playlists used by `play-playlist' function."
  :type 'string)

(defun just-play ()
  "Just play what ever is at `just-play-path'"
  (interactive)
  (emms-stop)
  (setq emms-source-file-default-directory just-play-path)
  (call-interactively 'emms-play-file)
  (emms-playlist-mode-go))

(setq emms-player-list '(emms-player-mpv))
(setq emms-info-functions '(emms-info-native))
(setq emms-source-file-default-directory "~/Music/")
(setq emms-repeat-playlist t)
(setq emms-mode-line-format "")

(global-set-key (kbd "C-c e g") 'emms-playlist-mode-go)
(global-set-key (kbd "C-c e f") 'just-play)
(global-set-key (kbd "C-c e b") 'emms-browser)
(global-set-key (kbd "C-c e p") 'play-playlist)
(global-set-key (kbd "C-c e r") 'emms-toggle-repeat-track)

(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-pause)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)

(emms-all)

(provide 'init-emms)

;;; init-emms.el ends here
