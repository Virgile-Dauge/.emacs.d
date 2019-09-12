(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq show-paren-delay 0)
(show-paren-mode 1)

(setq-default cursor-in-non-selected-windows 'hollow)

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :defer t
  :init
  (load-theme 'doom-one t))

(provide 'theme)

(use-package company
  :init
  ;; No delay in showing suggestions.
  (setq company-idle-delay 0)
  ;; Show suggestions after entering one character.
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  ;; Use tab key to cycle through suggestions.
  ;; ('tng' means 'tab and go')
  (company-tng-configure-default)
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)

;; global activation of the unicode symbol completion
(add-to-list 'company-backends 'company-math-symbols-unicode)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package org
  :config
  (setq org-directory "~/org-files"
        org-default-notes-file (concat org-directory "/todo.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-bullets
    :ensure t
    :config
    (setq org-bullets-bullet-list '("∙"))
    (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package writegood-mode
    :ensure t
    :bind ("C-c g" . writegood-mode)
    :config
    (add-to-list 'writegood-weasel-words "actionable"))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x c k" . counsel-yank-pop))

(use-package counsel-projectile
  :bind
  ("C-x v" . counsel-projectile)
  ("C-x c p" . counsel-projectile-ag)
  :config
  (counsel-projectile-on))

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package smex)

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))
