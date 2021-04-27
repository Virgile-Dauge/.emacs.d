- [Gestionnaire de packages](#org3734eaf)
  - [Initialisation et use-package](#org714b427)
  - [MAJ automatique](#orgd33995f)
  - [Message *deprecated cl*](#org26c4b9e)
  - [Emacs serveur](#org6cf2541)
  - [Lazy loading](#orgac64038)
- [Configs simples](#org0469a76)
  - [init.el ShortCut](#org47e2ce1)
  - [Suppression de la selection](#org1c6680d)
  - [Suppression des backups/autosaves/locks](#org88152bb)
  - [Suppression des menus](#orgd085a64)
  - [Plein écran par défaut](#orgbef1fd0)
  - [Montrer les paires de parenthèses](#orgdf368c2)
  - [Désactivation du curseur hors de la fenêtre sélectionnée](#org9ec43ab)
  - [Suppression des espaces avant sauvegarde du fichier](#org85307e6)
  - [Encodage Utf8 par défaut](#orgf5d102f)
  - [Unbind de raccourcis chiants](#orgf9ca5f3)
- [Visuals](#orgb63f19d)
  - [Theme](#org803c985)
    - [Doom](#orgb51125d)
    - [Ewal (copie terminal)](#org152fd5d)
    - [Mood-one](#org7453a9f)
    - [Night owl](#orgc822699)
    - [SubAtomic](#org321cded)
    - [Material](#org5eec390)
    - [Base 16](#org194cc65)
    - [nord-theme](#orgff6272b)
  - [Modeline](#org1a415ee)
    - [Doom](#org47ed273)
    - [Épurer la *modeline*](#orgcdc98b6)
  - [Icons](#org4d35373)
    - [All-the-icons](#org97e2c07)
  - [Fonts](#orgae64280)
  - [Pretty symbols](#orga86cf19)
    - [Global prettify](#org7f21150)
    - [Prettyfy only inside org babel blocs](#org7d429ce)
  - [Line number](#org5910b82)
- [Gestion projets](#org97f6015)
  - [projectile](#orgc5d60a9)
  - [Gestionnaire de version (Magit)](#org21b5869)
- [Aide à l'édition](#org44eea20)
  - [Curseurs multiples](#org27e723a)
  - [Iedit](#org5d871bc)
  - [Undo tree](#orgf6d5ac7)
  - [Completion](#org468c733)
    - [Text](#org613597f)
    - [TODO yasSnipets](#org7f244be)
  - [Writegood mode : besoin de tests](#orgbed0c8c)
  - [Move text](#orgf53e03e)
  - [Indentation](#orgdce7abe)
  - [Syntaxe (Flycheck)](#org0167a00)
  - [Orthographe (Fly Spell)](#org796893d)
- [Packages](#org8d165f3)
  - [LSP](#orgc789a3b)
  - [Dashboard](#orgabd76a2)
  - [COunsel ivy swiper](#orge7cd3b7)
  - [DONE Déplacements entre buffers](#orgca1210d)
  - [DONE Next key](#org0452255)
  - [DONE Expend selected region](#org202e5b4)
  - [Parenthèses et autres](#org5e33d41)
- [Programming modes](#orgde27a62)
  - [C/C++](#orgc1e203e)
    - [Irony](#orgb53693a)
  - [Python](#orge3dee74)
    - [Anaconda mode](#orgae621c9)
    - [Live python](#org211a14e)
    - [Auto Format on save](#org4db0b0f)
  - [Markdown](#orgf8e5029)
    - [Setup markdown mode](#orgbd6f146)
    - [Live preview on web browser](#org729e7f7)
    - [TODO preview](#orgab64ec7)
    - [TODO Preview (grip)](#orgcb99d73)
  - [JSON](#org533565d)
    - [Json mode](#org9349a7b)
    - [json navigator](#org12e3854)
- [Org](#orgb50eef6)
  - [Ajout d'org-mode et quelques config](#org8facdc5)
    - [Package org](#orgb0efbe8)
  - [Blocs source (babel)](#orga0027f4)
    - [python3 par défaut](#org228c36b)
    - [package babel ipython](#org464ae07)
    - [Liste des languages activés](#org0c4dd52)
    - [Affichage des images générées par défault](#org6c0fbdd)
  - [Apparence](#org21fd36a)
    - [Bullets](#org0cd93b9)
  - [Gestion références et citations](#org1c45d81)
    - [Org ref](#org7be9e9f)
  - [Tableau de bord](#org2c2985a)
  - [Export](#orgdf154e8)
    - [correction problème export \_](#orgcdd0bf6)
    - [Pandoc, multi format](#org6affe2d)
    - [Blog](#org3200431)
    - [HTML](#org6a00837)
    - [Export Latex](#orged2764e)
    - [Diapositives](#org30bc8a4)
    - [Github Markdown](#org113e321)
  - [Tangle](#org41a86d9)
  - [Tree view](#org2601ede)
  - [which app to open file with ?](#orga43b1be)
- [Contrôle de programmes externes](#orgb81d71c)



<a id="org3734eaf"></a>

# Gestionnaire de packages


<a id="org714b427"></a>

## Activated Initialisation et use-package

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


<a id="orgd33995f"></a>

## Activated MAJ automatique

```emacs-lisp
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
```


<a id="org26c4b9e"></a>

## Message *deprecated cl*

Certains packages dépendent du packet *cl* qui est *deprecated*. <https://github.com/kiwanami/emacs-epc/issues/35>

```emacs-lisp
(setq byte-compile-warnings '(cl-functions))
```


<a id="org6cf2541"></a>

## Futur Emacs serveur

<https://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html>

```bash
systemctl --user enable emacs
```


<a id="orgac64038"></a>

## Futur Lazy loading

<https://github.com/jwiegley/use-package#notes-about-lazy-loading>


<a id="org0469a76"></a>

# Configs simples


<a id="org47e2ce1"></a>

## Activated init.el ShortCut     :@Activated:a:

```emacs-lisp
(defun find-config ()
   "Edit readme.org"
   (interactive)
   (find-file "~/.emacs.d/readme.org"))

 (global-set-key (kbd "C-c I") 'find-config)
```


<a id="org1c6680d"></a>

## Activated Suppression de la selection

C'est un comportement dont j'ai l'habitude :

```emacs-lisp
(delete-selection-mode t)
```


<a id="org88152bb"></a>

## Testing Suppression des backups/autosaves/locks

```emacs-lisp
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)
```


<a id="orgd085a64"></a>

## Activated Suppression des menus

Désactiver le startup screen :

```emacs-lisp
(setq inhibit-startup-screen t)
```

Enlever les barres de menu et d'outils, c'est un minimum :

```emacs-lisp
;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (  fboundp 'tooltip-mode)
  (tooltip-mode -1))
```


<a id="orgbef1fd0"></a>

## Desactivated Plein écran par défaut

```emacs-lisp
(add-to-list 'default-frame-alist '(fullscreen . maximized))
```


<a id="orgdf368c2"></a>

## Activated Montrer les paires de parenthèses

Montrer les paires de parenthèses : <https://www.emacswiki.org/emacs/ShowParenMode>

```emacs-lisp
(setq show-paren-delay 0)
(show-paren-mode 1)
```


<a id="org9ec43ab"></a>

## Activated Désactivation du curseur hors de la fenêtre sélectionnée

Désactiver le curseur dans les fenetres non-actives:

```emacs-lisp
(setq-default cursor-in-non-selected-windows 'hollow)
```


<a id="org85307e6"></a>

## Activated Suppression des espaces avant sauvegarde du fichier

Suppression des espaces en fin de fichier avant de sauvegarder :

```emacs-lisp
;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
```


<a id="orgf5d102f"></a>

## Activated Encodage Utf8 par défaut

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


<a id="orgf9ca5f3"></a>

## Activated Unbind de raccourcis chiants

```emacs-lisp
;;(unbind-key "C-x C-f") ;; find-file-read-only
;;(unbind-key "C-x C-d") ;; list-directory
(unbind-key "C-z") ;; suspend-frame
(unbind-key "M-o") ;; facemenu-mode
(unbind-key "<mouse-2>") ;; pasting with mouse-wheel click
(unbind-key "<C-wheel-down>") ;; text scale adjust
```


<a id="orgb63f19d"></a>

# Visuals


<a id="org803c985"></a>

## Theme

Le site <https://peach-melpa.org/> propose une galerie des themes Emacs disponibles sur MELPA.


<a id="orgb51125d"></a>

### Activated Doom

Alternatives :

-   **doom-material:** cool
-   **doom-tomorrow-night:** ok
-   **doom-palenight:** cool
-   **doom-nord:** trop fade

```emacs-lisp
(use-package doom-themes
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
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
```


<a id="org152fd5d"></a>

### Desactivated Ewal (copie terminal)

```emacs-lisp
(use-package ewal
;;  :init (setq ewal-use-built-in-always-p nil
;;              ewal-use-built-in-on-failure-p t
;;              ewal-built-in-palette "sexy-material")
)
```

```emacs-lisp
(use-package ewal-doom-themes
  :init (progn
          (setq doom-theme-underline-parens t
                my:rice:font (font-spec
                              :family "Source Code Pro"
                              :weight 'semi-bold
                              :size 11.0))
          (show-paren-mode +1)
          (global-hl-line-mode)
          (set-frame-font my:rice:font nil t)
          (add-to-list  'default-frame-alist
                        `(font . ,(font-xlfd-name my:rice:font))))
  :config (progn
            (load-theme 'ewal-doom-one t)
            (enable-theme 'ewal-doom-one)))
```


<a id="org7453a9f"></a>

### Futur Mood-one

Inspiré de doom-one, il ne necéssite pas de dépendances. En revanche la repo est peut-être moins active. <https://gitlab.com/jessieh/mood-one-theme>


<a id="orgc822699"></a>

### Futur Night owl

<https://github.com/aaronjensen/night-owl-emacs>


<a id="org321cded"></a>

### Futur SubAtomic

<https://peach-melpa.org/themes/subatomic-theme/variants/subatomic?lang=rb>

```emacs-lisp
(use-package subatomic-theme)
(load-theme 'subatomic t)
```


<a id="org5eec390"></a>

### Desactivated Material

```emacs-lisp
(use-package material-theme)
(load-theme 'material t)
```


<a id="org194cc65"></a>

### Desactivated Base 16

```emacs-lisp
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-nord t))
```

-   **base16-material-palenight:** nope
-   **base16-material-darker:** nope
-   **base16-materia:** mouais
-   **base16-eighties:** mouais
-   **base16-twilight:** ok
-   **base16-nord:**

-   **base16-ocean:**

-   **base16-chalk:**


<a id="orgff6272b"></a>

### Desactivated nord-theme

```emacs-lisp
(use-package nord-theme
    :ensure t
    :config
    (load-theme 'nord t))

```


<a id="org1a415ee"></a>

## Modeline


<a id="org47ed273"></a>

### Activated Doom

```emacs-lisp
(use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-mode))
```


<a id="orgcdc98b6"></a>

### Activated Épurer la *modeline*

```emacs-lisp
(use-package diminish
  :config (diminish 'eldoc-mode))
```


<a id="org4d35373"></a>

## Icons


<a id="org97e2c07"></a>

### Activated All-the-icons

```emacs-lisp
(use-package all-the-icons)
```


<a id="orgae64280"></a>

## Testing Fonts

```emacs-lisp
;;(set-frame-font "Operator Mono 12" nil t)
(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)
```


<a id="orga86cf19"></a>

## Pretty symbols


<a id="org7f21150"></a>

### Activated Global prettify

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


<a id="org7d429ce"></a>

### Futur Prettyfy only inside org babel blocs


<a id="org5910b82"></a>

## Desactivated Line number

```emacs-lisp
(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))
```


<a id="org97f6015"></a>

# Gestion projets


<a id="orgc5d60a9"></a>

## Desactivated projectile

```emacs-lisp
(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))
```


<a id="org21b5869"></a>

## Activated Gestionnaire de version (Magit)

```emacs-lisp
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
```


<a id="org44eea20"></a>

# Aide à l'édition


<a id="org27e723a"></a>

## Futur Curseurs multiples

```emacs-lisp
(use-package multiple-cursors
  :bind (("C-c m m" . #'mc/edit-lines )
         ("C-c m d" . #'mc/mark-all-dwim )))
```


<a id="org5d871bc"></a>

## Futur Iedit

```emacs-lisp
(use-package iedit)

(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))



(global-set-key (kbd "C-c i") 'iedit-dwim)
```


<a id="orgf6d5ac7"></a>

## Futur Undo tree

```emacs-lisp
(use-package undo-tree
  :diminish
  :bind (("C-c _" . undo-tree-visualize))
  :config
  (global-undo-tree-mode +1)
  (unbind-key "M-_" undo-tree-map))
```


<a id="org468c733"></a>

## Completion


<a id="org613597f"></a>

### Futur Text

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


<a id="org7f244be"></a>

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


<a id="orgbed0c8c"></a>

## Futur Writegood mode : besoin de tests

```emacs-lisp
(use-package writegood-mode
    :ensure t
    :bind ("C-c g" . writegood-mode)
    :config
    (add-to-list 'writegood-weasel-words "actionable"))

(global-set-key "\C-c\C-gg" 'writegood-grade-level)
(global-set-key "\C-c\C-ge" 'writegood-reading-ease)
```


<a id="orgf53e03e"></a>

## Futur Move text

```emacs-lisp
(use-package move-text)
```


<a id="orgdce7abe"></a>

## Futur Indentation

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


<a id="org0167a00"></a>

## Futur Syntaxe (Flycheck)

J'utilise Flycheck pour vérifier la syntaxe à la volée

```emacs-lisp
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
```


<a id="org796893d"></a>

## Activated Orthographe (Fly Spell)

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


<a id="org8d165f3"></a>

# Packages


<a id="orgc789a3b"></a>

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
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
;;(use-package dap-PYTHON)
;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))
```


<a id="orgabd76a2"></a>

## Desactivated Dashboard

<https://github.com/emacs-dashboard/emacs-dashboard> An extensible emacs startup screen showing you what’s most important. install page-break-lines as it is required for dashboard.

```emacs-lisp
(use-package page-break-lines)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
```


<a id="orge7cd3b7"></a>

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


<a id="orgca1210d"></a>

## DONE Déplacements entre buffers

```emacs-lisp
(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))
```


<a id="org0452255"></a>

## DONE Next key

```emacs-lisp
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (add-hook 'after-init-hook 'which-key-mode))
```


<a id="org202e5b4"></a>

## DONE Expend selected region

```emacs-lisp
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))
```


<a id="org5e33d41"></a>

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


<a id="orgde27a62"></a>

# Programming modes


<a id="orgc1e203e"></a>

## C/C++


<a id="orgb53693a"></a>

### Futur Irony

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


<a id="orge3dee74"></a>

## Python


<a id="orgae621c9"></a>

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


<a id="org211a14e"></a>

### Desactivated Live python

live py est sympa mais uniquement pour des logiciels simples.

```emacs-lisp
(use-package live-py-mode)
```


<a id="org4db0b0f"></a>

### Futur Auto Format on save

<https://github.com/paetzke/py-autopep8.el>

```emacs-lisp
(use-package py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
```


<a id="orgf8e5029"></a>

## Markdown


<a id="orgbd6f146"></a>

### Desactivated Setup markdown mode

```emacs-lisp
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
```


<a id="org729e7f7"></a>

### Futur Live preview on web browser

<https://github.com/mola-T/flymd>

```emacs-lisp
(use-package flymd)
```


<a id="orgab64ec7"></a>

### Desactivated TODO preview

vmd-mode

```emacs-lisp
(use-package vmd-mode)
```

```bash
sudo npm install -g vmd
```

<https://github.com/jamcha-aa/auto-org-md/tree/9318338bdb7fe8bd698d88f3af89b2d6413efdd2>


<a id="orgcb99d73"></a>

### Desactivated TODO Preview (grip)

```emacs-lisp
;; Use keybindings
(use-package grip-mode)
```

```bash
sudo apt install grip
```


<a id="org533565d"></a>

## JSON


<a id="org9349a7b"></a>

### Activated Json mode

```emacs-lisp
(use-package json-mode)
```


<a id="org12e3854"></a>

### Desactivated json navigator

Un simple outil permettant de naviguer plus facilement dans un fichier Json.

```emacs-lisp
(use-package json-navigator)
```


<a id="orgb50eef6"></a>

# Org

<https://orgmode.org/worg/org-tutorials/org4beginners.html>


<a id="org8facdc5"></a>

## Ajout d'org-mode et quelques config

J'ai trouvé un site avec une config sympa : <https://jamiecollinson.com/blog/my-emacs-config/#org>


<a id="orgb0efbe8"></a>

### Activated Package org

ici, fontify et act natively servent à utiliser le mode majeur correspondant dans les blocs source.

```emacs-lisp
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
)
```


<a id="orga0027f4"></a>

## Blocs source (babel)


<a id="org228c36b"></a>

### Activated python3 par défaut

```emacs-lisp
(setq org-babel-python-command "python3")
```


<a id="org464ae07"></a>

### Activated package babel ipython

Afin de pouvoir gérer ipython, il faut installer le package org-babel ipython. On en profite pour utiliser python3 par défaut.

```emacs-lisp
(use-package ob-ipython
  :after org)
```


<a id="org0c4dd52"></a>

### Activated Liste des languages activés

Ajout du support de certains languages dans org-babel

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
    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)
)
```


<a id="org6c0fbdd"></a>

### Activated Affichage des images générées par défault

Toujours afficher les images après les avoir générées:

```emacs-lisp
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
```


<a id="org21fd36a"></a>

## Apparence


<a id="org0cd93b9"></a>

### Activated Bullets

Permet d'afficher des symboles utf-8 plutôt que des astérisques.

```emacs-lisp
(use-package org-bullets
    :ensure t
    :config
    ;; (setq org-bullets-bullet-list '("∙"))
    (add-hook 'org-mode-hook 'org-bullets-mode)
    )
```


<a id="org1c45d81"></a>

## Gestion références et citations


<a id="org7be9e9f"></a>

### Testing Org ref

Comme j'utilise Ivy et non Helm, j'ai besoin de ce package:

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


<a id="org2c2985a"></a>

## Tableau de bord

```emacs-lisp
(use-package org-dashboard)
```

\#+begin\_example


<a id="orgdf154e8"></a>

## Export

Liste des exporteurs : <https://orgmode.org/worg/exporters/index.html>


<a id="orgcdd0bf6"></a>

### Activated correction problème export \_

piste: TeX-like syntax for sub- and superscripts. If you write ‘^:{}’, ‘a<sub>b</sub>’ is interpreted, but the simple ‘a\_b’ is left as it is (org-export-with-sub-superscripts).

```emacs-lisp
(setq org-export-with-sub-superscripts '{})
```


<a id="org6affe2d"></a>

### Testing Pandoc, multi format

<https://github.com/kawabata/ox-pandoc> We need to install last version of pandoc from <https://github.com/jgm/pandoc/releases/>

```emacs-lisp
(use-package ox-pandoc)
```


<a id="org3200431"></a>

### Futur Blog

<https://melpa.org/#/ox-hugo>


<a id="org6a00837"></a>

### HTML

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

3.  Desactivated Bootstrap theme

    ```emacs-lisp
    (use-package ox-twbs
        :ensure t)
    ```

4.  Activated Background color

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

5.  Embed images

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


<a id="orged2764e"></a>

### Activated Export Latex

```emacs-lisp
(use-package ox-latex
  :ensure nil
  :init
  (setq org-latex-compiler "xelatex")
  (setq org-latex-pdf-process (list "latexmk -shell-escape -interaction=nonstopmode -pdf %f"))
  :config
  (add-to-list 'org-latex-packages-alist '("" "xcolor"))
  ;;(add-to-list 'org-latex-packages-alist '("" "mdframed"))
  (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
  (add-to-list 'org-latex-packages-alist '("" "mathtools"))
  (add-to-list 'org-latex-packages-alist '("" "amssymb"))
  (add-to-list 'org-latex-packages-alist '("" "amsthm"))
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
                       '("org-plain-latex"
                         "\\documentclass{article}
        [PACKAGES]
        \\usemintedstyle{native}
        \\definecolor{bg}{HTML}{202020}
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

    2.  thesul

        Création d'une classe thesul :

        ```emacs-lisp
        (with-eval-after-load 'ox-latex
          (add-to-list 'org-latex-classes
                       '("thesul"
                         "\\documentclass{thesul}
        [NO-DEFAULT-PACKAGES]
        [PACKAGES]
        %\\usepackage{xcolor}
        %\\usepackage[newfloat]{minted}
        \\usepackage[pdftex]{tulhypref}
        \\usemintedstyle{native}
        \\definecolor{bg}{HTML}{202020}
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


<a id="org30bc8a4"></a>

### Diapositives

1.  Futur Ioslides

    IOslide, joli et minimaliste <https://github.com/coldnew/org-ioslide>

    ```emacs-lisp
    (use-package ox-ioslide)
    ;;(use-package ox-ioslide-helper)
    ```

2.  Futur Html5slide

    html5slide, pas de maj depuis 6ans, on oublie : <https://github.com/coldnew/org-html5slide>

3.  Futur Reveal js

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

    t

4.  Futur Beamer

    ```emacs-lisp
    (use-package ox-beamer)
    ```


<a id="org113e321"></a>

### Activated Github Markdown

```emacs-lisp
(use-package ox-gfm
  :after org)
```


<a id="org41a86d9"></a>

## Tangle

```emacs-lisp
;;; noweb expansion only when you tangle
(setq org-babel-default-header-args
      (cons '(:noweb . "tangle")
            (assq-delete-all :noweb org-babel-default-header-args))
      )
```


<a id="org2601ede"></a>

## Desactivated Tree view

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


<a id="orga43b1be"></a>

## Testing which app to open file with ?

org was opening produced pdf files with gimp despite the system settings. I had to force evince by adding the following :

```emacs-lisp
(setq org-file-apps
  '(("\\.pdf\\'" . org.gnome.Evince.desktop)
    (auto-mode . emacs)))
```


<a id="orgb81d71c"></a>

# Contrôle de programmes externes

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
