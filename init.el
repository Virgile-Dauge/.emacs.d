;; Activated Straight.el

;; [[file:readme.org::*Straight.el][Straight.el:1]]
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
;; Straight.el:1 ends here

;; Activated config ShortCut                                  :@Activated:a:


;; [[file:readme.org::*config ShortCut][config ShortCut:1]]
(defun find-config ()
   "Edit readme.org"
   (interactive)
   (find-file "~/.emacs.d/readme.org"))

 (global-set-key (kbd "C-c I") 'find-config)
;; config ShortCut:1 ends here

;; Activated reload init                                      :@Activated:a:


;; [[file:readme.org::*reload init][reload init:1]]
(defun me/reload-init ()
  "Reload init.el."
  (interactive)
  (message "Reloading init.el...")
  (load user-init-file nil 'nomessage)
  (message "Reloading init.el... done."))
;; reload init:1 ends here

;; Activated Y-or-n

;; [[file:readme.org::*Y-or-n][Y-or-n:1]]
(defalias 'yes-or-no-p 'y-or-n-p)
;; Y-or-n:1 ends here

;; Activated Suppression de la selection
;; C'est un comportement dont j'ai l'habitude :

;; [[file:readme.org::*Suppression de la selection][Suppression de la selection:1]]
(delete-selection-mode t)
;; Suppression de la selection:1 ends here

;; Activated Pour empecher emacs de polluer

;; [[file:readme.org::*Pour empecher emacs de polluer][Pour empecher emacs de polluer:1]]
(use-package no-littering
  :demand t
  :config
  (setq
   auto-save-file-name-transforms
   `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))
;; Pour empecher emacs de polluer:1 ends here

;; Activated Montrer les paires de parenthèses
;; Montrer les paires de parenthèses : https://www.emacswiki.org/emacs/ShowParenMode

;; [[file:readme.org::*Montrer les paires de parenthèses][Montrer les paires de parenthèses:1]]
(setq show-paren-delay 0)
(show-paren-mode 1)
;; Montrer les paires de parenthèses:1 ends here

;; Activated Désactivation du curseur hors de la fenêtre sélectionnée
;; Désactiver le curseur dans les fenetres non-actives:

;; [[file:readme.org::*Désactivation du curseur hors de la fenêtre sélectionnée][Désactivation du curseur hors de la fenêtre sélectionnée:1]]
(setq-default cursor-in-non-selected-windows 'hollow)
;; Désactivation du curseur hors de la fenêtre sélectionnée:1 ends here

;; Activated Suppression des espaces avant sauvegarde du fichier
;; Suppression des espaces en fin de fichier avant de sauvegarder :

;; [[file:readme.org::*Suppression des espaces avant sauvegarde du fichier][Suppression des espaces avant sauvegarde du fichier:1]]
;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Suppression des espaces avant sauvegarde du fichier:1 ends here

;; Activated Encodage Utf8 par défaut
;; Tout passer en utf-8

;; [[file:readme.org::*Encodage Utf8 par défaut][Encodage Utf8 par défaut:1]]
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
;; Encodage Utf8 par défaut:1 ends here

;; Activated Unbind de raccourcis chiants


;; [[file:readme.org::*Unbind de raccourcis chiants][Unbind de raccourcis chiants:1]]
;;(unbind-key "C-x C-f") ;; find-file-read-only
;;(unbind-key "C-x C-d") ;; list-directory
(unbind-key "C-z") ;; suspend-frame
(unbind-key "M-o") ;; facemenu-mode
(unbind-key "<mouse-2>") ;; pasting with mouse-wheel click
(unbind-key "<C-wheel-down>") ;; text scale adjust
;; Unbind de raccourcis chiants:1 ends here

;; Activated Jetbrains

;; [[file:readme.org::*Jetbrains][Jetbrains:1]]
;;(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
;;(add-to-list 'default-frame-alist '(line-spacing . 0.2))
(set-frame-font "JetBrains Mono 13" nil t)
  ;;(set-fontset-font t 'unicode "STIXGeneral" nil 'prepend)
;; Jetbrains:1 ends here

;; Activated Ligatures

;; [[file:readme.org::*Ligatures][Ligatures:1]]
(use-package ligature
  :straight (:host github :repo "mickeynp/ligature.el")
  :defer 1
  :config
  (ligature-set-ligatures 't '("www"))
  (ligature-set-ligatures
   'prog-mode
   '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-"
     "<=>" "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
     "|||" "///" "&&&" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
     "|||>" "<|||" ">>" "<<" "::=" "|]" "[|" "{|" "|}"
     "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::"
     "+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
     "<:" ":<" ":>" ">:" "<>" "***" ";;" "/==" ".=" ".-" "__"
     "=/=" "<-<" ">" "<=<" ""
     ">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
     "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"
     "<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
     "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
     "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
     "&="))
  (global-ligature-mode t))
;; Ligatures:1 ends here

;; Activated Doom
;; Alternatives :

;; - doom-material :: cool
;; - doom-tomorrow-night :: ok
;; - doom-palenight :: cool
;; - doom-nord :: trop fade

;; [[file:readme.org::*Doom][Doom:1]]
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
;; Doom:1 ends here

;; Activated Doom
;;      [[https://github.com/seagle0128/doom-modeline][Doom modeline]]

;; [[file:readme.org::*Doom][Doom:1]]
(use-package doom-modeline
    :ensure t
    :hook (after-init . doom-modeline-mode))
;; Doom:1 ends here

;; Activated All-the-icons

;; [[file:readme.org::*All-the-icons][All-the-icons:1]]
(use-package all-the-icons
  :if (display-graphic-p))
;; All-the-icons:1 ends here

;; Tabs
;;     [[https://github.com/ema2159/centaur-tabs][Centaur Tabs]]

;; [[file:readme.org::*Tabs][Tabs:1]]
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
;; Tabs:1 ends here

;; Activated Gestionnaire de version (Magit)

;; [[file:readme.org::*Gestionnaire de version (Magit)][Gestionnaire de version (Magit):1]]
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))
;; Gestionnaire de version (Magit):1 ends here

;; Activated COunsel ivy swiper
;; https://github.com/abo-abo/swiper
;; #+begin_quote
;; This repository contains:

;; Ivy, a generic completion mechanism for Emacs.
;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper, an Ivy-enhanced alternative to Isearch.
;; #+end_quote


;; [[file:readme.org::*COunsel ivy swiper][COunsel ivy swiper:1]]
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
;; COunsel ivy swiper:1 ends here

;; complétion des commandes

;; [[file:readme.org::*complétion des commandes][complétion des commandes:1]]
(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-idle-secondary-delay 0.01)
  (which-key-dont-use-unicode t)
  :config
  (which-key-mode t))
;; complétion des commandes:1 ends here

;; Activated windmove

;; [[file:readme.org::*windmove][windmove:1]]
(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))
;; windmove:1 ends here

;; Orthographe
;; Fly Spell


;; [[file:readme.org::*Orthographe][Orthographe:1]]
(use-package flyspell
  :ensure t
  :defer t
  :hook (prog-mode text-mode org-mode)
)
;; Orthographe:1 ends here



;; Afin de pouvoir changer de langue facilement, j'ai trouvé la fonction
;; suivante :

;; [[file:readme.org::*Orthographe][Orthographe:2]]
(let ((langs '("francais" "english")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

(global-set-key [f6] 'cycle-ispell-languages)
;; Orthographe:2 ends here



;; Pour appliquer la correction, deux solutions me paraissent valables :
;; - Via Ivy

;; [[file:readme.org::*Orthographe][Orthographe:4]]
(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :after flyspell-correct)
;; Orthographe:4 ends here

;; Activated  yasSnipets
;;      yasnippet permet d'ajouter des blocs de codes prédéfinis.

;; [[file:readme.org::*yasSnipets][yasSnipets:1]]
(use-package yasnippet
  :config
  (yas-global-mode 1))
;; yasSnipets:1 ends here


;; adding a collection of snippets

;; [[file:readme.org::*yasSnipets][yasSnipets:2]]
(use-package yasnippet-snippets)
;; yasSnipets:2 ends here

;; Parenthèses
;;    Automatisation autour des parenthèses
;;    https://github.com/Fuco1/smartparens

;; [[file:readme.org::*Parenthèses][Parenthèses:1]]
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))
;; Parenthèses:1 ends here


;; Highlight parents

;; [[file:readme.org::*Parenthèses][Parenthèses:2]]
(use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
;; Parenthèses:2 ends here

;; Activated Package org
;;      ici, fontify et act natively servent à utiliser le mode majeur
;;      correspondant dans les blocs source.

;; [[file:readme.org::*Package org][Package org:1]]
(use-package org
  :config
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-startup-folded 'overview)
  :custom
  (org-startup-indented t)
)
;; Package org:1 ends here

;; inline pdf images

;; [[file:readme.org::*inline pdf images][inline pdf images:1]]
(use-package org-inline-pdf)
(add-hook 'org-mode-hook #'org-inline-pdf-mode)
;; inline pdf images:1 ends here

;; Activated python3 par défaut

;; [[file:readme.org::*python3 par défaut][python3 par défaut:1]]
(setq org-babel-python-command "python3")
;; python3 par défaut:1 ends here

;; Activated package babel ipython
;;  Afin de pouvoir gérer ipython, il faut installer le package org-babel
;;  ipython. On en profite pour utiliser python3 par défaut.

;; [[file:readme.org::*package babel ipython][package babel ipython:1]]
(use-package ob-ipython
  :after org)
;; package babel ipython:1 ends here

;; Activated Liste des languages activés
;;  Ajout du support de certains languages dans org-babel

;; [[file:readme.org::*Liste des languages activés][Liste des languages activés:1]]
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
;; Liste des languages activés:1 ends here

;; Activated Affichage des images générées par défault
;;  Toujours afficher les images après les avoir générées:


;; [[file:readme.org::*Affichage des images générées par défault][Affichage des images générées par défault:1]]
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;; Affichage des images générées par défault:1 ends here

;; Activated SUPERSTAR
;;  Permet d'afficher des symboles utf-8 plutôt que des astérisques.

;; [[file:readme.org::*SUPERSTAR][SUPERSTAR:1]]
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-headline-bullets-list '("⌾" "◈" "⚬" "▷")))
;; SUPERSTAR:1 ends here

;; Activated Org-ref
;;  Comme j'utilise Ivy et non Helm, le paquet /ivy-bibtex/ est
;;  nécessaire.

;;  J'utilise une bibliographie centralisée, que l'on va indiquer à
;;  /Org-ref/.



;; [[file:readme.org::*Org-ref][Org-ref:1]]
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
;; Org-ref:1 ends here

;; Activated correction problème export _
;;  piste: TeX-like syntax for sub- and superscripts. If
;;  you write ‘^:{}’, ‘a_{b}’ is interpreted, but the simple ‘a_b’ is left
;;  as it is (org-export-with-sub-superscripts).


;; [[file:readme.org::*correction problème export _][correction problème export _:1]]
(setq org-export-with-sub-superscripts '{})
;; correction problème export _:1 ends here



;; https://github.com/kawabata/ox-pandoc

;; Activation de l'exporteur pandoc

;; [[file:readme.org::*Pandoc, multi format][Pandoc, multi format:2]]
(use-package ox-pandoc)
;; Pandoc, multi format:2 ends here

;; Activated HTMLIZE

;; [[file:readme.org::*HTMLIZE][HTMLIZE:1]]
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
;; HTMLIZE:1 ends here

;; Activated Background color

;; [[file:readme.org::*Background color][Background color:1]]
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
;; Background color:1 ends here

;; Embed images
;;  Il est possible d'embarquer les images directement dans le fichier
;;  HTML, ce qui peut s'avérer pratique pour partager le document produit.

;; [[file:readme.org::*Embed images][Embed images:1]]
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
;; Embed images:1 ends here

;; Article
;;  Création d'une classe simple :

;; [[file:readme.org::*Article][Article:1]]
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
;; Article:1 ends here

;; Thesul
;;  Création d'une classe thesul :

;; [[file:readme.org::*Thesul][Thesul:1]]
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
;; Thesul:1 ends here

;; yathesis

;; [[file:readme.org::*yathesis][yathesis:1]]
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
;; yathesis:1 ends here

;; Nettoyage après compilation

;; [[file:readme.org::*Nettoyage après compilation][Nettoyage après compilation:1]]
(setq org-latex-logfiles-extensions (quote ("lol" "flg" "lof" "lot" "tex" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pygtex" "pygstyle")))
(setq org-latex-remove-logfiles t)
;; Nettoyage après compilation:1 ends here

;; Activated Github Markdown

;; [[file:readme.org::*Github Markdown][Github Markdown:1]]
(use-package ox-gfm
  :after org)
;; Github Markdown:1 ends here

;; Tangle


;; [[file:readme.org::*Tangle][Tangle:1]]
;;; noweb expansion only when you tangle
(setq org-babel-default-header-args
      (cons '(:noweb . "tangle")
            (assq-delete-all :noweb org-babel-default-header-args))
      )
;; Tangle:1 ends here


;; Installation coté emacs :
;; https://emacs-lsp.github.io/lsp-mode/page/installation/


;; [[file:readme.org::*Language Server Protocol][Language Server Protocol:2]]
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
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; Language Server Protocol:2 ends here
