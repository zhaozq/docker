;; .emacs
;;; uncomment this line to disable loading of "default.el" at startup
(setq inhibit-default-init t)

;; auto save set
(setq auto-save-default nil)
(setq make-backup-files nil)

;; command set
(define-key global-map (kbd "C-c x")   'eshell)
(define-key global-map (kbd "C-c m")   'compile)
(define-key global-map (kbd "C-c s c") 'shell-command)
(define-key global-map (kbd "C-c i")   'replace-string)

;; load-path
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/my")
(add-to-list 'load-path "~/.emacs.d/soft/ac")
(add-to-list 'load-path "~/.emacs.d/soft/rails-reloaded")
(add-to-list 'load-path "~/.emacs.d/go-modes")
(add-to-list 'load-path "~/.emacs.d/modes")
(add-to-list 'load-path "~/.emacs.d/modes/ruby-mode")
(add-to-list 'load-path "~/.emacs.d/modes/css-mode")

;; tab set
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux")
(setq c-basic-offset 4)

;; scroll
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 10000)

;; wind move
(windmove-default-keybindings)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Lang set
;; f90 set
(add-to-list 'auto-mode-alist '("\\.f\\'"   . f90-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'"  . lisp-mode))
(add-to-list 'auto-mode-alist '("\\akefile" . makefile-mode))

;; theme set
(setq molokai-theme-kit t)
(require 'molokai)

;; linum set
(global-linum-mode 1)
(require 'linum+)

;; ibuffer set
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; ido set
(require 'ido)
(ido-mode t)
(setq ido-auto-merge-work-directories-length -1)

;; ac set
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/soft/ac/ac-dict")

(ac-config-default)
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'asm-mode)
(add-to-list 'ac-modes 'c-mode)

(setq ac-use-menu-map t)
(define-key ac-completing-map "\C-n" 'ac-next)
(define-key ac-completing-map "\C-p" 'ac-previous)

;; self script
(require 'self)

;; ruby mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
                            '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; css mode
(require 'css-mode)
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist
      (append '(("\\.css.scss$" . css-mode))
              auto-mode-alist))

;; rails
;;(require 'rails-autoload)
(require 'cmake-mode)

(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))
(add-to-list 'ac-modes 'cmake-mode)

(require 'go-mode-autoloads)

(load-file "~/.emacs.d/modes/graphviz-dot-mode.el")
(add-to-list 'ac-modes 'graphviz-dot-mode)
(global-set-key (kbd "C-c p") 'graphviz-dot-preview)

(tool-bar-mode 0)
(menu-bar-mode 0)
;;(scroll-bar-mode 0)

(require 'php-mode)

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
