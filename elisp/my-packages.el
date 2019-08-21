(use-package htmlize
      :ensure t)

;;(add-to-list 'load-path "/opt/ros/melodic/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
;;(use-package rosemacs-config)

(use-package yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(use-package cmake-mode)

(use-package ros)
(setq ros-default-workspace "catkin_ws")

(use-package counsel-spotify)
	:bind
	(global-set-key (kbd "C-c s s") 'counsel-spotify-search-tracks-by-artist)
	(global-set-key (kbd "C-c s n") 'counsel-spotify-next)
	(global-set-key (kbd "C-c s b") 'counsel-spotify-previous)
	(global-set-key (kbd "C-c s p") 'counsel-spotify-toggle-play-pause)
	(global-set-key (kbd "C-c s g") 'counsel-spotify-toggle-play-pause)
        :config
  	(setq counsel-spotify-client-id "f614782caa124b179dab2e2a4b3ea0f0")
	(setq counsel-spotify-client-secret "5c0f97fd58944fc7b825b1bb108de2b2")
(use-package popup)
(use-package git-messenger)
	:bind
  	(global-set-key (kbd "C-c m p") 'git-messenger:popup-message)

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (C . t)
     (dot . t)
   ))
    (setq org-confirm-babel-evaluate nil)
)

(use-package drag-stuff)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;;(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))
(use-package org-edit-latex)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(use-package duplicate-thing)
(global-set-key (kbd "C-c d") 'duplicate-thing)

(provide 'my-packages)
