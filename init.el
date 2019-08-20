;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'my-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)
(require 'my-packages)

(require 'lang-python)

(require 'lang-c)

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
