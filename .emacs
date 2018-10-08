(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq visible-cursor nil)
(blink-cursor-mode 0)

(setq evil-want-C-u-scroll t)

(require 'evil)
(evil-mode 1)

;; remove all keybindings from insert-state keymap
(setcdr evil-insert-state-map nil)

;; but [escape] should switch back to normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(require 'xcscope)
(cscope-setup)
(setq cscope-do-not-update-database t)

;; set font
(add-to-list 'default-frame-alist '(font . "Source code pro-14" ))
(set-face-attribute 'default t :font "Source code pro-14" )

;; keyboard scroll one line at a time
(setq scroll-step 1) 

;; enable line numbers for c files
(global-linum-mode t)

;; disable menu bar
(menu-bar-mode -1)

;; c margins style and offset
(setq c-default-style "linux" c-basic-offset 3)
(add-to-list 'auto-mode-alist '("\\.pc\\'" . c-mode))
(setq sh-basic-offset 2)

;; tmp files
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves/")))

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(3 6 9 12 15 18))
(setq sh-basic-offset 3 sh-indentation 3)

(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-buffer-file-coding-system 'utf-8-unix)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (magit ## evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(toggle-frame-maximized)

;; bind keys
(define-key global-map [(meta ctrl i)] 'cscope-set-initial-directory) 
