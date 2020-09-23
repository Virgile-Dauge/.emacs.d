(defun find-config ()
   "Edit readme.org"
   (interactive)
   (find-file "~/.emacs.d/readme.org"))

 (global-set-key (kbd "C-c I") 'find-config)

(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(delete-selection-mode t)

(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

(setq inhibit-startup-screen t)

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

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :defer t
  :init
  (load-theme 'doom-one t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package all-the-icons)

;;(set-frame-font "Operator Mono 12" nil t)
(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)

(setq prettify-symbols-unprettify-at-point 'right-edge)
(global-prettify-symbols-mode 1)
(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
                                     ("#+END_SRC" . "†")
                                     ("#+begin_src" . "†")
                                     ("#+end_src" . "†")
                                     (">=" . "≥")
                                     ("=>" . "⇨")
                                     ("def" . "𝒇")
                                     ("class" . "𝑪")
                                     ("and" . "∧")
                                     ("or" . "∨")
                                     ("not" . "￢")
                                     ("in" . "∈")
                                     ("not in" . "∉")
                                     ("return" . "⟼")
                                     ("yield" . "⟻")
                                     ("for" . "∀")
                                     ("!=" . "≠")
                                     ("==" . "＝")
                                     (">=" . "≥")
                                     ("<=" . "≤")))


(add-hook 'org-mode-hook 'prettify-symbols-mode)
(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(("def" . "𝒇")
           ("class" . "𝑪")
           ("and" . "∧")
           ("or" . "∨")
           ("not" . "￢")
           ("in" . "∈")
           ("not in" . "∉")
           ("return" . "⟼")
           ("yield" . "⟻")
           ("for" . "∀")
           ("!=" . "≠")
           ("==" . "＝")
           (">=" . "≥")
           ("<=" . "≤")
           ("=" . "≝")))))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
(use-package dap-PYTHON)
;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
)

(use-package ob-ipython
  :after org)

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (ipython . t)
     (python  . t)
     (C       . t)
     (dot     . t)
     (shell   . t)
   ))
    (setq org-confirm-babel-evaluate nil)
)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(use-package org-bullets
    :ensure t
    :config
    ;; (setq org-bullets-bullet-list '("∙"))
    (add-hook 'org-mode-hook 'org-bullets-mode)
    )

(use-package org-ref)

(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

(use-package ox-pandoc)

(use-package ox-twbs
    :ensure t)

(add-to-list 'org-latex-packages-alist '("" "xcolor"))
(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-listings 'minted)

(setq org-latex-header-extra
      '(concat
        org-latex-header-extra
        "\\usemintedstyle{native}"))

(use-package ox-reveal)
(setq org-reveal-root "file:///home/virgile/reveal.js")
(use-package htmlize)

(defadvice htmlize-buffer-1 (around ome-htmlize-buffer-1 disable)
  (rainbow-delimiters-mode -1)
  ad-do-it
  (rainbow-delimiters-mode t))

(defun ome-htmlize-setup ()
  (if (el-get-read-package-status 'rainbow-delimiters)
      (progn
        (ad-enable-advice 'htmlize-buffer-1 'around 'ome-htmlize-buffer-1)
        (ad-activate 'htmlize-buffer-1))))

(use-package ox-gfm
  :after org)

(defun my/org-inline-css-hook (exporter)
  "Insert custom inline css to automatically set the
background of code to whatever theme I'm using's background"

  (let* ((my-pre-bg (face-background 'default))
         (my-pre-fg (face-foreground 'default)))
    (setq
     org-html-head-extra
     (concat
      org-html-head-extra
      (format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
              my-pre-bg my-pre-fg)))))

(add-hook 'org-export-before-processing-hook 'my/org-inline-css-hook)

;;; noweb expansion only when you tangle
(setq org-babel-default-header-args
      (cons '(:noweb . "tangle")
            (assq-delete-all :noweb org-babel-default-header-args))
      )

(use-package org-ql)

(use-package org-super-agenda)

(use-package org-sidebar)

(use-package page-break-lines)
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

(use-package all-the-icons-ivy)

(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package move-text)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flyspell)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

(let ((langs '("francais" "english")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

(global-set-key [f6] 'cycle-ispell-languages)

(use-package flyspell-correct-ivy
  :bind ("C-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

(use-package anaconda-mode
  :hook
  (python-mode . anaconda-mode)
  (python-mode . anaconda-eldoc-mode))

(add-hook 'python-mode-hook (lambda () (setq python-indent-offset 4)))
(setq-default indent-tabs-mode nil)  ; use only spaces and no tabs

(setq org-babel-python-command "python3")

(use-package py-autopep8)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
