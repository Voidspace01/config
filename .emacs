(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq visible-cursor nil)

(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

;; remove all keybindings from insert-state keymap
(setcdr evil-insert-state-map nil)

;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; keyboard scroll one line at a time
(setq scroll-step 1) 

;; enable line numbers for c files
(global-linum-mode t)

;; disable menu bar
(menu-bar-mode -1)
