- [Config ShortCut](#org6bbca40)
- [Base](#orgb60ecf8)
  - [Initialisation et use-package](#org7cf09d5)
  - [MAJ automatique](#org46c0886)
  - [Sauvegardes](#orgdf33671)
  - [Emacs serveur](#orgfd73c73)
  - [Lazy loading](#orge662ee6)
- [Theme](#org4188d39)
  - [Actuel](#org1924231)
  - [A tester :](#orgd056226)
    - [Mood-one](#org51fdbbd)
    - [Night owl](#orgf461e45)
    - [SubAtomic](#orgc82792d)
  - [Compléments](#org3daf950)
  - [Fonts](#org0453177)
  - [pretty symbols](#org25251c9)
- [Packages](#orgbeaac30)
  - [LSP](#orgae342e7)
  - [Completion](#orgf3c6cc6)
    - [Text](#orgc5d88fc)
    - [yasSnipets](#org75b78c7)
  - [Org](#orgb753475)
    - [Ajout d'org-mode et quelques config](#org1a828a9)
    - [Blocs source (babel)](#org7b31863)
    - [Apparence](#orgd58cdd0)
    - [Gestion références et citations](#orgaf7b8e1)
    - [Tableau de bord](#org2c7dced)
    - [Export](#orgb32af86)
    - [Tangle](#org56dc743)
    - [Tree view](#orge98d32a)
  - [Writegood mode : besoin de tests](#orgc4b98ce)
  - [Dashboard](#orga06ef6c)
  - [COunsel ivy swiper](#orgc118be7)
  - [Line number](#org2008b70)
  - [Gestion projets](#orga6cb232)
  - [Déplacements entre buffers](#orgbd6aca3)
  - [Next key](#orgde33c88)
  - [Expend selected region](#org21912c0)
  - [Parenthèses et autres](#orgc9ffb08)
  - [Move text](#org0174b18)
  - [Indentation](#org78513ba)
  - [Gestionnaire de version (Magit)](#org66694bc)
  - [Syntaxe (Flycheck)](#org02c346f)
  - [Orthographe (Fly Spell)](#orgdefe852)
  - [C/C++](#orgd81b847)
  - [Python](#org477e721)
    - [Auto Format](#orgd43a5af)
  - [Markdown](#org8a039f2)
    - [preview](#org10b04ea)
    - [Preview (grip)](#org6f9d42f)
  - [Contrôle de programmes externes](#org03f6740)
  - [JSON](#org096c7dd)
  - [Blog](#orgeafd663)



<a id="org6bbca40"></a>

# DONE Config ShortCut

```emacs-lisp
(defun find-config ()
   "Edit readme.org"
   (interactive)
   (find-file "~/.emacs.d/readme.org"))

 (global-set-key (kbd "C-c I") 'find-config)
```


<a id="orgb60ecf8"></a>

# TODO Base


<a id="org7cf09d5"></a>

## Initialisation et use-package

Initialisation des dépôts d'archives et installation de use-package.

```emacs-lisp
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
```


<a id="org46c0886"></a>

## MAJ automatique

```emacs-lisp
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
```


<a id="orgdf33671"></a>

## Sauvegardes

Gestion des backups :

```emacs-lisp
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )
```

Désactiver le startup screen :

```emacs-lisp
(setq inhibit-startup-screen t)
```

Tout passer en utf-8

```emacs-lisp
;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
```

Enlever les barres de menu et d'outils, c'est un minimum :

```emacs-lisp
;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
```

Montrer les paires de parenthèses : <https://www.emacswiki.org/emacs/ShowParenMode>

```emacs-lisp
(setq show-paren-delay 0)
(show-paren-mode 1)
```

Désactiver le curseur dans les fenetres non-actives:

```emacs-lisp
(setq-default cursor-in-non-selected-windows 'hollow)
```

Suppression des espaces en fin de fichier avant de sauvegarder :

```emacs-lisp
;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
```


<a id="orgfd73c73"></a>

## TODO Emacs serveur

<https://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html>

```bash
systemctl --user enable emacs
```


<a id="orge662ee6"></a>

## TODO Lazy loading

<https://github.com/jwiegley/use-package#notes-about-lazy-loading>


<a id="org4188d39"></a>

# DONE Theme

Le site <https://peach-melpa.org/> propose une galerie des themes Emacs disponibles sur MELPA.


<a id="org1924231"></a>

## Actuel

J'ai trouvé le thème doom-one vraiment sympa.

```emacs-lisp
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
```


<a id="orgd056226"></a>

## A tester :


<a id="org51fdbbd"></a>

### Mood-one

Inspiré de doom-one, il ne necéssite pas de dépendances. En revanche la repo est peut-être moins active. <https://gitlab.com/jessieh/mood-one-theme>


<a id="orgf461e45"></a>

### Night owl

<https://github.com/aaronjensen/night-owl-emacs>


<a id="orgc82792d"></a>

### SubAtomic

<https://peach-melpa.org/themes/subatomic-theme/variants/subatomic?lang=rb>


<a id="org3daf950"></a>

## Compléments

```emacs-lisp
(use-package all-the-icons)
```


<a id="org0453177"></a>

## Fonts

```emacs-lisp
;;(set-frame-font "Operator Mono 12" nil t)
(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)
```


<a id="org25251c9"></a>

## pretty symbols

```emacs-lisp
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
```


<a id="orgbeaac30"></a>

# Packages


<a id="orgae342e7"></a>

## LSP

```emacs-lisp
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
```


<a id="orgf3c6cc6"></a>

## Completion


<a id="orgc5d88fc"></a>

### TODO Text

1.  Company <https://company-mode.github.io/>

    ```emacs-lisp
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
    ```

    ajout d'une pop-up avec Company quickhelp <https://github.com/expez/company-quickhelp>

    ```emacs-lisp
    (use-package company-quickhelp
      :config
      (company-quickhelp-mode 1))
    ```

2.  Backends company

    Liste des backends : <https://github.com/company-mode/company-mode/wiki/Third-Party-Packages> backends selectionées:

    -   Pour les symboles de Maths : <https://github.com/vspinu/company-math>

        ```emacs-lisp
        ;; global activation of the unicode symbol completion
        (add-to-list 'company-backends 'company-math-symbols-unicode)
        ```

        If you are using AUCTeX you might need to use TeX-mode-hook instead: (add-hook 'TeX-mode-hook 'my-latex-mode-setup)
    -   Latex : <https://github.com/alexeyr/company-auctex/>

    -   Python

        ```emacs-lisp
        (eval-after-load "company"
          '(add-to-list 'company-backends 'company-anaconda))
        ```


<a id="org75b78c7"></a>

### TODO yasSnipets

yasnippet permet d'ajouter des blocs de codes prédéfinis.

```emacs-lisp
(use-package yasnippet
  :config
  (yas-global-mode 1))
```

adding a collection of snippets

```emacs-lisp
(use-package yasnippet-snippets)
```

1.  TODO Ajout de snippets personalisés:


<a id="orgb753475"></a>

## Org

<https://orgmode.org/worg/org-tutorials/org4beginners.html>


<a id="org1a828a9"></a>

### Ajout d'org-mode et quelques config

J'ai trouvé un site avec une config sympa : <https://jamiecollinson.com/blog/my-emacs-config/#org>

ici, fontify et act natively servent à utiliser le mode majeur correspondant dans les blocs source.

```emacs-lisp
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
)
```


<a id="org7b31863"></a>

### Blocs source (babel)

Afin de pouvoir gérer ipython, il faut installer le package org-babel ipython

```emacs-lisp
(use-package ob-ipython
  :after org)
```

ajout du support de certains languages dans org-babel

```emacs-lisp
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
```

Toujours afficher les images après les avoir générées:

```emacs-lisp
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
```


<a id="orgd58cdd0"></a>

### Apparence

Permet d'afficher des symboles utf-8 plutôt que des astérisques.

```emacs-lisp
(use-package org-bullets
    :ensure t
    :config
    ;; (setq org-bullets-bullet-list '("∙"))
    (add-hook 'org-mode-hook 'org-bullets-mode)
    )
```


<a id="orgaf7b8e1"></a>

### TODO Gestion références et citations

```emacs-lisp
(use-package org-ref)

(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
```


<a id="org2c7dced"></a>

### Tableau de bord

```emacs-lisp
(use-package org-dashboard)
```

\#+begin<sub>example</sub>


<a id="orgb32af86"></a>

### Export

Liste des exporteurs : <https://orgmode.org/worg/exporters/index.html>

1.  TODO problème export \_

    piste: TeX-like syntax for sub- and superscripts. If you write ‘^:{}’, ‘a<sub>b</sub>’ is interpreted, but the simple ‘a<sub>b</sub>’ is left as it is (org-export-with-sub-superscripts).

2.  TODO Pandoc, multi format

    <https://github.com/kawabata/ox-pandoc> We need to install last version of pandoc from <https://github.com/jgm/pandoc/releases/>

    ```emacs-lisp
    (use-package ox-pandoc)
    ```

3.  Blog

    <https://melpa.org/#/ox-hugo>

4.  TODO Export HTML

    <https://github.com/fniessen/org-html-themes>

    ```emacs-lisp
    (use-package ox-twbs
        :ensure t)
    ```

5.  Coloration Syntaxique

    ```emacs-lisp
    (add-to-list 'org-latex-packages-alist '("" "xcolor"))
    (add-to-list 'org-latex-packages-alist '("" "minted"))

    (setq org-latex-listings 'minted)
    ```

    ```emacs-lisp
    (setq org-latex-header-extra
          '(concat
            org-latex-header-extra
            "\\usemintedstyle{native}"))
    ```

6.  Diapositives

    1.  TODO Ioslides

        IOslide, joli et minimaliste <https://github.com/coldnew/org-ioslide>

        ```emacs-lisp
        (use-package ox-ioslide)
        ;;(use-package ox-ioslide-helper)
        ```

    2.  Html5slide

        html5slide, pas de maj depuis 6ans, on oublie : <https://github.com/coldnew/org-html5slide>

    3.  TODO Reveal js

        <https://github.com/hakimel/reveal.js/> To install reveal js locally :

        ```bash
        cd ~/
        git clone https://github.com/hakimel/reveal.js/
        npm update node-sass
        npm install
        ```

        as stated in <https://github.com/yjwen/org-reveal>: The easiest way of getint org-reveal is to instal ox-reveal from melpa

        ```emacs-lisp
        (use-package ox-reveal)
        (setq org-reveal-root "file:///home/virgile/reveal.js")
        (use-package htmlize)
        ```

        to come arount rainbow delimiter incompatibility issues :

        ```emacs-lisp
        (defadvice htmlize-buffer-1 (around ome-htmlize-buffer-1 disable)
          (rainbow-delimiters-mode -1)
          ad-do-it
          (rainbow-delimiters-mode t))

        (defun ome-htmlize-setup ()
          (if (el-get-read-package-status 'rainbow-delimiters)
              (progn
                (ad-enable-advice 'htmlize-buffer-1 'around 'ome-htmlize-buffer-1)
                (ad-activate 'htmlize-buffer-1))))
        ```

    4.  TODO Beamer

        ```emacs-lisp
        (use-package ox-beamer)
        ```

7.  Github Markdown

    ```emacs-lisp
    (use-package ox-gfm
      :after org)
    ```

8.  Background color

    ```emacs-lisp
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
    ```


<a id="org56dc743"></a>

### Tangle

```emacs-lisp
;;; noweb expansion only when you tangle
(setq org-babel-default-header-args
      (cons '(:noweb . "tangle")
            (assq-delete-all :noweb org-babel-default-header-args))
      )
```


<a id="orge98d32a"></a>

### Tree view

On va utiliser *org-sidebar*, mais il dépend de :

-   ***org-ql*:** provides a query language for Org files

```emacs-lisp
(use-package org-ql)
```

-   ***org-super-agenda*:** group items into sections, rather than having them all in one big list.

```emacs-lisp
(use-package org-super-agenda)
```

```emacs-lisp
(use-package org-sidebar)
```


<a id="orgc4b98ce"></a>

## TODO Writegood mode : besoin de tests

```emacs-lisp
(use-package writegood-mode
    :ensure t
    :bind ("C-c g" . writegood-mode)
    :config
    (add-to-list 'writegood-weasel-words "actionable"))

(global-set-key "\C-c\C-gg" 'writegood-grade-level)
(global-set-key "\C-c\C-ge" 'writegood-reading-ease)
```


<a id="orga06ef6c"></a>

## DONE Dashboard

<https://github.com/emacs-dashboard/emacs-dashboard> An extensible emacs startup screen showing you what’s most important. install page-break-lines as it is required for dashboard.

```emacs-lisp
(use-package page-break-lines)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
```


<a id="orgc118be7"></a>

## COunsel ivy swiper

```emacs-lisp
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

```


<a id="org2008b70"></a>

## TODO Line number

```emacs-lisp
(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))
```


<a id="orga6cb232"></a>

## TODO Gestion projets

```emacs-lisp
(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))
```


<a id="orgbd6aca3"></a>

## DONE Déplacements entre buffers

```emacs-lisp
(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))
```


<a id="orgde33c88"></a>

## DONE Next key

```emacs-lisp
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode))
```


<a id="org21912c0"></a>

## DONE Expend selected region

```emacs-lisp
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))
```


<a id="orgc9ffb08"></a>

## Parenthèses et autres

Automatisation autour des parenthèses <https://github.com/Fuco1/smartparens>

```emacs-lisp
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))
```

Highlight parents

```emacs-lisp
(use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
```

expend parents redondant avec smartparens ?

```emacs-lisp
(add-hook 'prog-mode-hook 'electric-pair-mode)
```


<a id="org0174b18"></a>

## DONE Move text

```emacs-lisp
(use-package move-text)
```


<a id="org78513ba"></a>

## TODO Indentation

```emacs-lisp
(use-package aggressive-indent
    :ensure t)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
```

aggressive indent ne fonctionne pas avec python, on peut l'activer, mais cela ne fonctionne pas super bien. J'ai donc retiré le code suivant de ma config.

```emacs-lisp
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))
(setq aggressive-indent-excluded-modes
      (remove 'python-mode aggressive-indent-excluded-modes))
```


<a id="org66694bc"></a>

## DONE Gestionnaire de version (Magit)

```emacs-lisp
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
```


<a id="org02c346f"></a>

## TODO Syntaxe (Flycheck)

J'utilise Flycheck pour vérifier la syntaxe à la volée

```emacs-lisp
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
```


<a id="orgdefe852"></a>

## DONE Orthographe (Fly Spell)

```emacs-lisp
(use-package flyspell)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)
```

On veut l'activer sur org et Latex :

```emacs-lisp

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

```

Afin de pouvoir changer de langue facilement, j'ai trouvé la fonction suivante :

```emacs-lisp
(let ((langs '("francais" "english")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

(global-set-key [f6] 'cycle-ispell-languages)
```

Il faut installer aspell ainsi que le dictionnaire français.

```bash
sudo apt install aspell aspell-fr
```

Pour appliquer la correction, deux solutions me paraissent valables :

-   Via Ivy

```emacs-lisp
(use-package flyspell-correct-ivy
  :bind ("C-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))
```

-   Via popup

```emacs-lisp
(use-package flyspell-correct-popup
  :bind ("C-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-popup))
```


<a id="orgd81b847"></a>

## TODO C/C++

Le built in est bon, mais j'aimerai tester Irony <https://github.com/Sarcasm/irony-mode>

```emacs-lisp
(use-package irony
    :ensure t
    :hook
    (c-mode . irony-mode)
    (c++-mode . irony-mode)
    (irony-mode . irony-cdb-autosetup-compile-options))
```

Irony-Server prerequisites irony-server provides the libclang interface to irony-mode. It uses a simple protocol based on S-expression. This server, written in C++ and requires the following packages to be installed on your system:

-CMake >= 2.8.3 -libclang

ajout du support de company

```emacs-lisp
(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))
```

Ajout du support de flycheck

```emacs-lisp
(use-package flycheck-irony
    :ensure t
    :hook (flycheck-mode . flycheck-irony-setup))
```


<a id="org477e721"></a>

## Python

Le mode Anaconda est paraît-il plus complet que le mode intégré :

```emacs-lisp
(use-package anaconda-mode
  :hook
  (python-mode . anaconda-mode)
  (python-mode . anaconda-eldoc-mode))
```

```bash
sudo pip install pyflakes pep8
```

Pour ce débarasser des problèmes d'indentations mixte et régler l'indentation a 4 espace: <https://www.emacswiki.org/emacs/NoTabs>

```emacs-lisp
(add-hook 'python-mode-hook (lambda () (setq python-indent-offset 4)))
(setq-default indent-tabs-mode nil)  ; use only spaces and no tabs
```

```emacs-lisp
(setq org-babel-python-command "python3")
```

live py est sympa mais uniquement pour des logiciels simples.

```emacs-lisp
(use-package live-py-mode)
```


<a id="orgd43a5af"></a>

### Auto Format

```emacs-lisp
(use-package py-autopep8)
```


<a id="org8a039f2"></a>

## TODO Markdown

```emacs-lisp
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
```

Ne fonctionne pas sur firefox actuellement.

```emacs-lisp
(use-package flymd)
```


<a id="org10b04ea"></a>

### TODO preview

vmd-mode

```emacs-lisp
(use-package vmd-mode)
```

```bash
sudo npm install -g vmd
```

<https://github.com/jamcha-aa/auto-org-md/tree/9318338bdb7fe8bd698d88f3af89b2d6413efdd2>


<a id="org6f9d42f"></a>

### TODO Preview (grip)

```emacs-lisp
;; Use keybindings
(use-package grip-mode)
```

```bash
sudo apt install grip
```


<a id="org03f6740"></a>

## Contrôle de programmes externes

Openwith permet d'ouvrir certains types de fichiers avec des outils externes.

```emacs-lisp
(use-package openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "evince" (file))))
```

Spotify.el : je n'arrive pas à le faire fonctionner correctement

```emacs-lisp
(use-package spotify
  :init
  (setq spotify-oauth2-client-secret "5c0f97fd58944fc7b825b1bb108de2b2")
  (setq spotify-oauth2-client-id "f614782caa124b179dab2e2a4b3ea0f0")
  (setq spotify-transport 'connect)
  :bind-keymap
  ("C-c ." . spotify-keymap-prefix)
)
```

Counsel-spotify:

```emacs-lisp
(use-package counsel-spotify
  :init
  (setq counsel-spotify-client-secret "5c0f97fd58944fc7b825b1bb108de2b2")
  (setq counsel-spotify-client-id "f614782caa124b179dab2e2a4b3ea0f0")
)
```


<a id="org096c7dd"></a>

## JSON

Un simple outil permettant de naviguer plus facilement dans un fichier Json.

```emacs-lisp
(use-package json-navigator)
```


<a id="orgeafd663"></a>

## Blog

<https://github.com/masasam/emacs-easy-hugo>
