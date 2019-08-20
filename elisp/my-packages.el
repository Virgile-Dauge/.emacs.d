(use-package htmlize
      :ensure t)

(add-to-list 'load-path "/opt/ros/melodic/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
(require 'rosemacs-config)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

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

(provide 'my-packages)
