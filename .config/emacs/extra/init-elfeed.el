;;; init-elfeed.el --- Elfeed Configuration file -*- lexical-binding: t -*-

(require 'elfeed)

(setq elfeed-db-directory (concat user-emacs-directory "/.elfeed"))

(defun elfeed-open-in-mpv ()
  "Open a elfeed entry in mpv."
  (interactive)
  (setq link (elfeed-search-selected :single))
  (if link
      (call-process-shell-command
       (concat "mpv " (elfeed-entry-link link) " &") nil 0)
    (message "ERROR: nothing selected"))
  (elfeed-search-untag-all-unread))

(elfeed-search-set-filter "@1-months-ago +unread -emacs")

(add-hook 'elfeed-new-entry-hook
	  (elfeed-make-tagger :before "4 weeks ago"
			      :remove 'unread))
(setq elfeed-feeds
      '(;; Joe Rogan
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCzQUP1qoWDoEbmsQxvdjxgQ" podcast video)
	;; Jesse Michels
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCuG2KzrIMe3qoNcuDVpwnXw" podcast video)
	;; Diesel Creek
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCBB0oz7Yo_35gnbPYGKGJTA" video)
	;; Scrappy Industries
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCyacDPsLkX-KDqYMZPpmtDQ" video)
	;; Skote Outdoors
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCXiH_m2Bqew7JZ8pv84xbow" video)
	;; Welker Farms
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCtKUW8LJK2Ev8hUy9ZG_PPA" video)
	;; ActionAdventureTwins
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCuM_RUD-2-3dyIsBQHNorTA" video)
	;; ActionAdventureClips
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCkxpL_HvNX6TWxLGz0VZFVA" video)
	;; Usagi Electric
	("https://www.youtube.com/feeds/videos.xml?channel_id=UCE4xstUnu0YmkG-W9_PyYrQ" video)
	;; Protesilaos Stavrou
	("https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g" video)
	("https://planet.emacslife.com/atom.xml" blog emacs)
	("https://www.alpinelinux.org/atom.xml"  blog)))

(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-c l") 'elfeed-open-in-mpv)

(provide 'init-elfeed)

;;; init-elfeed.el ends here
