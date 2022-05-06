;; Activated Suppression des menus
;; Désactiver le startup screen :

;; [[file:readme.org::*Suppression des menus][Suppression des menus:1]]
(setq inhibit-startup-screen t)
;; Suppression des menus:1 ends here


;; Enlever les barres de menu et d'outils :

;; [[file:readme.org::*Suppression des menus][Suppression des menus:2]]
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
;; Suppression des menus:2 ends here

;; Activated Désactivation de package.el
;; A utiliser uniquement si l'on souhaite utiliser le gestionnaire de
;; paquet alternatif [[https://github.com/raxod502/straight.el][straigh.el]].

;; [[file:readme.org::*Désactivation de package.el][Désactivation de package.el:1]]
(setq package-enable-at-startup nil)
;; Désactivation de package.el:1 ends here

;; Activated Message /deprecated cl/
;; Certains packages dépendent du packet /cl/ qui est /deprecated/.
;; https://github.com/kiwanami/emacs-epc/issues/35


;; [[file:readme.org::*Message /deprecated cl/][Message /deprecated cl/:1]]
(setq byte-compile-warnings '(cl-functions))
;; Message /deprecated cl/:1 ends here
