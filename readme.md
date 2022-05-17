- [Fichier de configuration précoce](#orga824b25)
  - [Suppression des menus](#org1e33a7a)
  - [Désactivation de package.el](#org981fc0e)
  - [Message *deprecated cl*](#org4187adb)
- [Fichier de configuration principal](#orgc214eff)
  - [Gestionnaire de paquets](#org023218a)
    - [Straight.el](#orgfc51cc8)
    - [Initialisation et use-package](#org2886b33)
  - [Configurations simples](#orgd40d399)
    - [config ShortCut](#org3c32b45)
    - [reload init](#orga7db096)
    - [Y-or-n](#orgd603849)
    - [Suppression de la selection](#orgc31522c)
    - [Pour empecher emacs de polluer](#org50e1188)
    - [Montrer les paires de parenthèses](#org5beb70b)
    - [Désactivation du curseur hors de la fenêtre sélectionnée](#org5a3761d)
    - [Suppression des espaces avant sauvegarde du fichier](#org2e77010)
    - [Encodage Utf8 par défaut](#org39ea9a8)
    - [Unbind de raccourcis chiants](#org7bea3b2)
  - [Visuals](#org79622c6)
    - [Font](#orgce5cf6d)
    - [Theme](#org8b04071)
    - [Modeline](#org59316b5)
    - [Icons](#orgf7f7893)
    - [Pretty symbols](#orgdd8476e)
    - [Tabs](#org62003d1)
  - [Gestionnaire de versions](#org6150110)
    - [Gestionnaire de version (Magit)](#orgd8f2cce)
  - [Complétion (tout sauf code)](#org7c1a295)
    - [COunsel ivy swiper](#org803c485)
    - [complétion des commandes](#org0bdc05c)
  - [Déplacements entre buffers](#org3afb76e)
    - [windmove](#org6b4eb86)
  - [Orthographe](#org7c51699)
  - [snipets](#orgf23ce70)
    - [yasSnipets](#org20cf221)
  - [Parenthèses](#org5abf8f5)
  - [Org-mode](#org5cc76d0)
    - [inline pdf images](#orga3dc38a)
    - [Blocs source (babel)](#org6aa8c45)
    - [Apparence](#org0b11156)
    - [Gestion références et citations](#org5fabe2f)
    - [Export vers différents formats](#orgb1e5439)
    - [Tangle](#org012d030)
  - [Language Server Protocol](#org58e015b)
    - [Backends languages](#orgc3fbeb4)
- [Pas traité](#orgc61c27a)
  - [Language Server Protocol](#orgb9dd435)
    - [Testing Anaconda mode](#org431964f)
    - [Futur Auto Format on save](#org6bb564b)
  - [JSON](#org63af42e)
    - [Json mode](#org9f65d2a)



<a id="orga824b25"></a>

# Fichier de configuration précoce

Introduit dans emacs 27, ce fichier [early-init.el](https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html) est exécuté avant le chargement de l'interface et du système de paquets.


<a id="org1e33a7a"></a>

## Activated Suppression des menus

Désactiver le startup screen :

```emacs-lisp
(setq inhibit-startup-screen t)
```

Enlever les barres de menu et d'outils :

```emacs-lisp
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
```


<a id="org981fc0e"></a>

## Activated Désactivation de package.el

A utiliser uniquement si l'on souhaite utiliser le gestionnaire de paquet alternatif [straigh.el](https://github.com/raxod502/straight.el).

```emacs-lisp
(setq package-enable-at-startup nil)
```


<a id="org4187adb"></a>

## Activated Message *deprecated cl*

Certains packages dépendent du packet *cl* qui est *deprecated*. <https://github.com/kiwanami/emacs-epc/issues/35>

```emacs-lisp
(setq byte-compile-warnings '(cl-functions))
```


<a id="orgc214eff"></a>

# Fichier de configuration principal


<a id="org023218a"></a>

## Gestionnaire de paquets


<a id="orgfc51cc8"></a>

### Activated Straight.el

```emacs-lisp
;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
	     :custom (straight-use-package-by-default t))
```


<a id="org2886b33"></a>

### Desactivated Initialisation et use-package

Initialisation des dépôts d'archives et installation de use-package, qui est une macro permettant d'isoler les configurations paquet par paquet. <https://github.com/jwiegley/use-package>

```emacs-lisp
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(unless (and (fboundp 'package-installed-p)
       (package-installed-p 'use-package))
  (package-initialize)
  (package-refresh-contents)
  (package-install 'use-package))

;;(require 'use-package)
;;(use-package auto-compile
;;  :config (auto-compile-on-load-mode))
;;(setq load-prefer-newer t)
```


<a id="orgd40d399"></a>

## Configurations simples


<a id="org3c32b45"></a>

### Activated config ShortCut     :@Activated:a:

```emacs-lisp
(defun find-config ()
   "Edit readme.org"
   (interactive)
   (find-file "~/.emacs.d/readme.org"))

 (global-set-key (kbd "C-c I") 'find-config)
```


<a id="orga7db096"></a>

### Activated reload init     :@Activated:a:

```emacs-lisp
(defun me/reload-init ()
  "Reload init.el."
  (interactive)
  (message "Reloading init.el...")
  (load user-init-file nil 'nomessage)
  (message "Reloading init.el... done."))
```


<a id="orgd603849"></a>

### Activated Y-or-n

```emacs-lisp
(defalias 'yes-or-no-p 'y-or-n-p)
```


<a id="orgc31522c"></a>

### Activated Suppression de la selection

C'est un comportement dont j'ai l'habitude :

```emacs-lisp
(delete-selection-mode t)
```


<a id="org50e1188"></a>

### Activated Pour empecher emacs de polluer

```emacs-lisp
(use-package no-littering
  :demand t
  :config
  (setq
   auto-save-file-name-transforms
   `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))
```


<a id="org5beb70b"></a>

### Activated Montrer les paires de parenthèses

Montrer les paires de parenthèses : <https://www.emacswiki.org/emacs/ShowParenMode>

```emacs-lisp
(setq show-paren-delay 0)
(show-paren-mode 1)
```


<a id="org5a3761d"></a>

### Activated Désactivation du curseur hors de la fenêtre sélectionnée

Désactiver le curseur dans les fenetres non-actives:

```emacs-lisp
(setq-default cursor-in-non-selected-windows 'hollow)
```


<a id="org2e77010"></a>

### Activated Suppression des espaces avant sauvegarde du fichier

Suppression des espaces en fin de fichier avant de sauvegarder :

```emacs-lisp
;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
```


<a id="org39ea9a8"></a>

### Activated Encodage Utf8 par défaut

Tout passer en utf-8

```emacs-lisp
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
```


<a id="org7bea3b2"></a>

### Activated Unbind de raccourcis chiants

```emacs-lisp
;;(unbind-key "C-x C-f") ;; find-file-read-only
;;(unbind-key "C-x C-d") ;; list-directory
(unbind-key "C-z") ;; suspend-frame
(unbind-key "M-o") ;; facemenu-mode
(unbind-key "<mouse-2>") ;; pasting with mouse-wheel click
(unbind-key "<C-wheel-down>") ;; text scale adjust
```


<a id="org79622c6"></a>

## Visuals


<a id="orgce5cf6d"></a>

### Font

1.  Firacode

    ```emacs-lisp
    (use-package fira-code-mode
      ;; :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
      :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes
    ```

2.  Activated Jetbrains

    ```emacs-lisp
    ;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
    ;;(add-to-list 'default-frame-alist '(line-spacing . 0.2))
    (set-frame-font "JetBrains Mono 13" nil t)
      ;;(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)
    ```

3.  Activated Ligatures

    ```emacs-lisp
    (use-package ligature
      :straight (:host github :repo "mickeynp/ligature.el")
      :defer 1
      :config
      (ligature-set-ligatures 't '("www"))
      (ligature-set-ligatures
       'prog-mode
       '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "<<-" "->" "<-"
         "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
         "|||" "///" "&&&" "===" "++" "--" "=>"
         "::"
         "+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
         "***" ";;" "/==" ".=" ".-" "__"
         "</>" "</" "/>"
         "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
         "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
         "&="))
      (global-ligature-mode t))
    ```


<a id="org8b04071"></a>

### Theme

Le site <https://peach-melpa.org/> propose une galerie des themes Emacs disponibles sur MELPA.

1.  Activated Doom

    Alternatives :

    -   **doom-material:** cool
    -   **doom-tomorrow-night:** ok
    -   **doom-palenight:** cool
    -   **doom-nord:** trop fade

    ```emacs-lisp
    (use-package doom-themes
      :ensure t
      :config
      ;; Global settings (defaults)
      (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
    	doom-themes-enable-italic t) ; if nil, italics is universally disabled
      (load-theme 'doom-material t)

      ;; Enable flashing mode-line on errors
      (doom-themes-visual-bell-config)
      ;; Enable custom neotree theme (all-the-icons must be installed!)
      (doom-themes-neotree-config)
      ;; or for treemacs users
      (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
      (doom-themes-treemacs-config)
      ;; Corrects (and improves) org-mode's native fontification.
      (doom-themes-org-config))

    ```

2.  Desactivated Nano emacs

    <https://github.com/rougier/nano-emacs>

    ```emacs-lisp
    (straight-use-package
     '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))
    (require 'nano-faces)
    (nano-faces)
    ```


<a id="org59316b5"></a>

### Modeline

1.  Activated Doom

    [Doom modeline](https://github.com/seagle0128/doom-modeline)

    ```emacs-lisp
    (use-package doom-modeline
        :ensure t
        :hook (after-init . doom-modeline-mode))
    ```

2.  Desactivated Épurer la *modeline*

    ```emacs-lisp
    (use-package diminish
      :config (diminish 'eldoc-mode))
    ```


<a id="orgf7f7893"></a>

### Icons

1.  Activated All-the-icons

    ```emacs-lisp
    (use-package all-the-icons
      :if (display-graphic-p))
    ```


<a id="orgdd8476e"></a>

### Pretty symbols

1.  Desactivated Global prettify

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


<a id="org62003d1"></a>

### Tabs

[Centaur Tabs](https://github.com/ema2159/centaur-tabs)

```emacs-lisp
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-set-icons t)
  (centaur-tabs-gray-out-icons 'buffer)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
```


<a id="org6150110"></a>

## Gestionnaire de versions


<a id="orgd8f2cce"></a>

### Activated Gestionnaire de version (Magit)

```emacs-lisp
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
```


<a id="org7c1a295"></a>

## Complétion (tout sauf code)


<a id="org803c485"></a>

### Activated COunsel ivy swiper

<https://github.com/abo-abo/swiper>

> This repository contains:
>
> Ivy, a generic completion mechanism for Emacs. Counsel, a collection of Ivy-enhanced versions of common Emacs commands. Swiper, an Ivy-enhanced alternative to Isearch.

```emacs-lisp
(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x c k" . counsel-yank-pop))

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


<a id="org0bdc05c"></a>

### complétion des commandes

```emacs-lisp
(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-idle-secondary-delay 0.01)
  (which-key-dont-use-unicode t)
  :config
  (which-key-mode t))
```


<a id="org3afb76e"></a>

## Déplacements entre buffers


<a id="org6b4eb86"></a>

### Activated windmove

```emacs-lisp
(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))
```


<a id="org7c51699"></a>

## Orthographe

Fly Spell

```emacs-lisp
(use-package flyspell
  :ensure t
  :defer t
  :hook (prog-mode text-mode org-mode)
)
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
(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :after flyspell-correct)
```

-   Via popup

```emacs-lisp
(use-package flyspell-correct-popup
  :bind ("C-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-popup))
```


<a id="orgf23ce70"></a>

## snipets


<a id="org20cf221"></a>

### Activated yasSnipets

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


<a id="org5abf8f5"></a>

## Parenthèses

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


<a id="org5cc76d0"></a>

## Org-mode

<https://orgmode.org/worg/org-tutorials/org4beginners.html> J'ai trouvé un site avec une config sympa : <https://jamiecollinson.com/blog/my-emacs-config/#org>

1.  Activated Package org

    ici, fontify et act natively servent à utiliser le mode majeur correspondant dans les blocs source.

    ```emacs-lisp
    (use-package org
      :config
      (setq org-src-fontify-natively t)
      (setq org-src-tab-acts-natively t)
      (setq org-startup-folded 'overview)
      :custom
      (org-startup-indented t)
    )
    ```


<a id="orga3dc38a"></a>

### inline pdf images

```emacs-lisp
(use-package org-inline-pdf)
(add-hook 'org-mode-hook #'org-inline-pdf-mode)
```


<a id="org6aa8c45"></a>

### Blocs source (babel)

1.  Desactivated python3 par défaut

    ```emacs-lisp
    (setq org-babel-python-command "python3")
    ```

2.  Desactivated package babel ipython

    Afin de pouvoir gérer ipython, il faut installer le package org-babel ipython. On en profite pour utiliser python3 par défaut.

    ```emacs-lisp
    (use-package ob-ipython
      :after org)
    ```

3.  Activated package jupyter

    <https://github.com/nnicandro/emacs-jupyter>

    ```emacs-lisp
    (use-package jupyter
      :after org
    )
    (defun display-ansi-colors ()
      (ansi-color-apply-on-region (point-min) (point-max)))

    (add-hook 'org-babel-after-execute-hook #'display-ansi-colors)
    ```

4.  Activated Liste des languages activés

    Ajout du support de certains languages dans org-babel

    ```emacs-lisp
    (with-eval-after-load 'org
      (org-babel-do-load-languages
       'org-babel-load-languages
       '(
         ;;(ipython . t)
         (python  . t)
         (jupyter . t)
         (shell   . t)
       ))
        (setq org-confirm-babel-evaluate nil)
        (setq org-src-fontify-natively t)
        (setq org-src-tab-acts-natively t)
    )
    (org-babel-jupyter-override-src-block "python")
    ```

5.  Activated Affichage des images générées par défault

    Toujours afficher les images après les avoir générées:

    ```emacs-lisp
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
    ```

6.  LSP-mode dans les blocs de code source babel

    <https://emacs-lsp.github.io/lsp-mode/manual-language-docs/lsp-org/>


<a id="org0b11156"></a>

### Apparence

1.  Activated SUPERSTAR

    Permet d'afficher des symboles utf-8 plutôt que des astérisques.

    ```emacs-lisp
    (use-package org-superstar
      :after org
      :hook (org-mode . org-superstar-mode)
      ;;:custom
      ;;(org-superstar-headline-bullets-list '("⌾" "◈" "⚬" "▷"))
      )
    ```


<a id="org5fabe2f"></a>

### Gestion références et citations

1.  Activated Org-ref

    Comme j'utilise Ivy et non Helm, le paquet *ivy-bibtex* est nécessaire.

    J'utilise une bibliographie centralisée, que l'on va indiquer à *Org-ref*.

    ```emacs-lisp
    (use-package ivy-bibtex)

    (use-package org-ref
      :after org
      :init
      (setq reftex-default-bibliography '("~/bibliography/library.bib"))
      (setq org-ref-default-bibliography '("~/bibliography/library.bib"))
      (setq org-ref-pdf-directory '("~/bibliography/pdfs"))
      (setq bibtex-completion-pdf-open-function 'org-open-file)
      (setq org-ref-completion-library 'org-ref-ivy-cite)
      )
    ```

    Il reste à modifier le processus d'exportation,


<a id="orgb1e5439"></a>

### Export vers différents formats

Liste des exporteurs : <https://orgmode.org/worg/exporters/index.html>

1.  Activated correction problème export \_

    piste: TeX-like syntax for sub- and superscripts. If you write ‘^:{}’, ‘a<sub>b</sub>’ is interpreted, but the simple ‘a\_b’ is left as it is (org-export-with-sub-superscripts).

    ```emacs-lisp
    (setq org-export-with-sub-superscripts '{})
    ```

2.  Pandoc, multi format

    We need to install last version of pandoc from <https://github.com/jgm/pandoc/releases/>

    ```bash
    sudo apt install pandoc
    ```

    <https://github.com/kawabata/ox-pandoc>

    Activation de l'exporteur pandoc

    ```emacs-lisp
    (use-package ox-pandoc)
    ```

3.  HTML

    1.  Activated HTMLIZE

        ```emacs-lisp
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
        ```

    2.  Activated readthedocs theme

        <https://github.com/fniessen/org-html-themes> To use this, just add the following in your .org file

        ```emacs-lisp
        #+SETUPFILE: https://fniessen.github.io/org-html-themes/org/theme-readtheorg.setup
        ```

        Then export it with standart latex exporter

        ```emacs-lisp
        C-c C-e h h
        ```

    3.  Activated Background color

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

    4.  Embed images

        Il est possible d'embarquer les images directement dans le fichier HTML, ce qui peut s'avérer pratique pour partager le document produit.

        ```emacs-lisp
        (defun replace-in-string (what with in)
          (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

        (defun format-image-inline (source attributes info)
          (progn
            (setq source (replace-in-string "%20" " " source))
            (format "<img src=\"data:image/%s;base64,%s\"%s />"
        	    (or (file-name-extension source) "")
        	    (base64-encode-string
        	     (with-temp-buffer
        	       (insert-file-contents-literally source)
        	      (buffer-string)))
        	    (file-name-nondirectory source))
            ))
        ;;(defun format-image-inline (source attributes info)
        ;;  (let* ((ext (file-name-extension source))
        ;;         (prefix (if (string= "svg" ext) "data:image/svg+xml;base64," "data:;base64,"))
        ;;         (data (with-temp-buffer (url-insert-file-contents source) (buffer-string)))
        ;;         (data-url (concat prefix (base64-encode-string data)))
        ;;         (attributes (org-combine-plists `(:src ,data-url) attributes)))
        ;;    (org-html-close-tag "img" (org-html--make-attribute-string attributes) info)))

        (defun org-html-export-to-mhtml (async subtree visible body)
          (cl-letf (((symbol-function 'org-html--format-image) 'format-image-inline))
            (org-html-export-to-html nil subtree visible body)))

        (org-export-define-derived-backend 'html-inline-images 'html
          :menu-entry '(?h "Export to HTML" ((?m "As MHTML file and open" org-html-export-to-mhtml))))
        ```

4.  Desactivated Export Latex

    ```emacs-lisp
    (use-package ox-latex
      :ensure nil
      :init
      (setq org-latex-compiler "xelatex")
      (setq org-latex-compilers '("xelatex" "pdflatex" "lualatex"))
      (setq org-latex-pdf-process (list "latexmk -xelatex -shell-escape -interaction=nonstopmode -f %f"))
      :config
      (add-to-list 'org-latex-packages-alist '("" "xcolor"))
      ;;(add-to-list 'org-latex-packages-alist '("" "mdframed"))
      (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
      (add-to-list 'org-latex-packages-alist '("" "mathtools"))
      (add-to-list 'org-latex-packages-alist '("" "amsfonts"))
      (add-to-list 'org-latex-packages-alist '("" "amssymb"))
      (add-to-list 'org-latex-packages-alist '("" "amsmath"))
      (add-to-list 'org-latex-packages-alist '("" "amsthm"))
      (add-to-list 'org-latex-packages-alist '("" "fontspec"))
      (add-to-list 'org-latex-packages-alist '("" "graphicx"))
      (add-to-list 'org-latex-packages-alist '("" "caption"))
      (add-to-list 'org-latex-packages-alist '("" "breakcites"))

      ;; outputdir=build
      (setq org-latex-prefer-user-labels t)
      (setq org-latex-listings 'minted)
      (setq org-latex-minted-options '(("bgcolor" "bg")))
      (add-to-list 'org-latex-minted-langs '(python "python"))
      )
    ```

    options minted intéressantes :

    -   **mathescape:** latex math mode pour les commentaires
    -   **autogobble:** Remove (gobble) all common leading whitespace from code.
    -   **breaklines, breakafter 80:** Break lines after specified characters, not just at spaces, whenbreaklines=true

    1.  Ajout de classes

        1.  Article

            Création d'une classe simple :

            ```emacs-lisp
            (with-eval-after-load 'ox-latex
              (add-to-list 'org-latex-classes
            	       '("base"
            		 "\\documentclass{article}
            [PACKAGES]
            \\usemintedstyle{native}
            \\definecolor{bg}{HTML}{202020}
            \\setmonofont[Contextuals={Alternate}]{Fira Code}
            %\\usemintedstyle{material}
            %\\definecolor{bg}{HTML}{263238}
            %\\surroundwithmdframed{minted}
            [EXTRA]"
            		 ("\\section{%s}" . "\\section*{%s}")
            		 ("\\subsection{%s}" . "\\subsection*{%s}")
            		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
            		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
            ```

        2.  Thesul

            Création d'une classe thesul :

            ```emacs-lisp
            (with-eval-after-load 'ox-latex
              (add-to-list 'org-latex-classes
            	       '("thesul"
            		 "\\documentclass{thesul}
            [NO-DEFAULT-PACKAGES]
            [PACKAGES]
            \\definecolor{bg}{HTML}{202020}
            \\definecolor{b}{HTML}{1E90FF}
            \\definecolor{o}{HTML}{ffa91e}
            \\definecolor{r}{HTML}{ff381e}
            \\definecolor{aubergine}{HTML}{370028}
            \\definecolor{citeblue}{HTML}{0d5fb8}

            %\\usepackage[xelatex]{tulhypref}
            \\usepackage{tulhypref}
            \\usepackage{pdfpages}
            \\hypersetup{
              colorlinks = true,
              linkcolor = {citeblue},
              citecolor = {citeblue},
              urlcolor = {o}
            }
            \\usepackage[french]{minitoc}
            %\\mtcsetdepth{1}
            %\\mtcsettitle{minitoc}{Sommaire}
            %\\mtcsetrules{minitoc}{off}
            \\usemintedstyle{native}
            \\usepackage{tikz}
            \\setmonofont[Contextuals={Alternate}]{Fira Code}
            \\usepackage{pifont}
            \\usepackage{ccicons}
            \\usepackage{gensymb}
            \\newcommand{\\xmark}{\\ding{55}}
            %\\usemintedstyle{material}
            %\\definecolor{bg}{HTML}{263238}
            %\\surroundwithmdframed{minted}
            "
            		 ("\\chapter{%s}" . "\\chapter{%s}")
            		 ("\\section{%s}" . "\\section{%s}")
            		 ("\\subsection{%s}" . "\\subsection{%s}")
            		 ("\\subsubsection{%s}" . "\\subsubsection{%s}")
            		 ("\\paragraph{%s}" . "\\paragraph*{%s}"))))
            ```

        3.  yathesis

            ```emacs-lisp
            (with-eval-after-load 'ox-latex
              (add-to-list 'org-latex-classes
            	       '("yathesis"
            		 "\\documentclass{yathesis}
            [PACKAGES]
            \\usemintedstyle{native}
            \\definecolor{bg}{HTML}{202020}
            %\\usemintedstyle{material}
            %\\definecolor{bg}{HTML}{263238}
            %\\surroundwithmdframed{minted}
            [EXTRA]"
            		 ("\chapter{%s}" . "\chapter{%s}")
            		 ("\section{%s}" . "\section{%s}")
            		 ("\subsection{%s}" . "\subsection{%s}")
            		 ("\subsubsection{%s}" . "\subsubsection{%s}")
            		 ("\paragraph{%s}" . "\paragraph*{%s}"))))
            ```

            Création de fichiers de setup:

            ```org
            # -*- mode: org; -*-
            #+LaTeX_CLASS: org-plain-latex
            #+LaTeX_CLASS_OPTIONS: [letter]
            #+LATEX_HEADER: \usepackage{lmodern} % Ensures we have the right font

            #+LATEX_HEADER: \usepackage[utf8]{inputenc}
            #+LATEX_HEADER: \usepackage[T1]{fontenc}
            #+LATEX_HEADER: \usepackage{babel}
            #+LATEX_HEADER: \usepackage{graphicx}
            #+LATEX_HEADER: \usepackage{amsmath, amsthm, amssymb}
            #+LATEX_HEADER: \usepackage[table, xcdraw]{xcolor}
            #+LATEX_HEADER: \usepackage[hidelinks]{hyperref}
            #+LATEX_HEADER: \usepackage{framed}
            #+LATEX_HEADER: \usepackage{minted}
            #+LATEX_HEADER: \usemintedstyle{pastie}
            ```

    2.  Nettoyage après compilation

        ```emacs-lisp
        (setq org-latex-logfiles-extensions (quote ("lol" "flg" "lof" "lot" "tex" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pygtex" "pygstyle")))
        (setq org-latex-remove-logfiles t)
        ```

    3.  Testing Coloration Syntaxique

        ```emacs-lisp
        (setq org-latex-listings 'minted)
        ```

        ```emacs-lisp
        (setq org-latex-header-extra
              '(concat
        	org-latex-header-extra
        	"\\usemintedstyle{native}"))
        ```

5.  Diapositives

    1.  Futur Reveal js

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

6.  Activated Github Markdown

    ```emacs-lisp
    (use-package ox-gfm
      :after org)
    ```


<a id="org012d030"></a>

### Tangle

```emacs-lisp
;;; noweb expansion only when you tangle
(setq org-babel-default-header-args
      (cons '(:noweb . "tangle")
	    (assq-delete-all :noweb org-babel-default-header-args))
      )
```


<a id="org58e015b"></a>

## Language Server Protocol

Installation coté emacs : <https://emacs-lsp.github.io/lsp-mode/page/installation/>

```emacs-lisp
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (python-mode . lsp)
	 (rust-mode . lsp)
	 ;; if you want which-key integration
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

```


<a id="orgc3fbeb4"></a>

### Backends languages

1.  Python

    Installation de la backend python <https://github.com/python-lsp/python-lsp-server>

    ```bash
    pip install python-lsp-server[all] pyls-mypy pyls-memestra
    ```

    ```bash
    sudo apt install libjansson-dev
    ```

2.  Rust

    [Rust Analyser](https://github.com/rust-lang/rust-analyzer)

    ```emacs-lisp
    (use-package rustic)
    ```


<a id="orgc61c27a"></a>

# Pas traité


<a id="orgb9dd435"></a>

## Language Server Protocol

```emacs-lisp
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))
```

Installation coté emacs : <https://emacs-lsp.github.io/lsp-mode/page/installation/>

```emacs-lisp
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (python-mode . lsp)
	 ;; if you want which-key integration
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

```


<a id="org431964f"></a>

### Testing Anaconda mode

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


<a id="org6bb564b"></a>

### Futur Auto Format on save

<https://github.com/paetzke/py-autopep8.el>

```emacs-lisp
(use-package py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
```


<a id="org63af42e"></a>

## JSON


<a id="org9f65d2a"></a>

### Activated Json mode

```emacs-lisp
(use-package json-mode)
```