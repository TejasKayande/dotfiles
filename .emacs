
(load-file "~/.emacs.d/.emacs-custom.el")
(add-to-list 'load-path "~/.emacs.d/extern/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun usless-func ()
  "A function that does nothing."
  (interactive))

;; Evil mode
(require 'evil)
(require 'evil-smartparens)
(evil-mode t)

;; undefening useless evil-mode keybinds
(define-key evil-normal-state-map (kbd "q") 'usless-func)
(define-key evil-normal-state-map (kbd "K") 'usless-func)
(define-key evil-visual-state-map (kbd "K") 'usless-func)
(with-eval-after-load 'evil (define-key evil-normal-state-map "K" nil))

;; defining some new evil-mode eybinds
(define-key evil-emacs-state-map  (kbd "<escape>") 'evil-normal-state)
(define-key evil-emacs-state-map  (kbd "C-[")      'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-r")      'undo-redo)
(define-key evil-normal-state-map (kbd "C-u")      'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-y")      'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "gc")       'comment-dwim)
(define-key evil-normal-state-map (kbd "m")        'evil-record-macro)
(define-key evil-normal-state-map (kbd "K")        'evil-jump-item)
(evil-smartparens-mode 1)

;; mini buffer autocompletions
(ido-mode 1)
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point 2
      ido-create-new-buffer 'always
      ido-max-prospects 10
      ido-auto-merge-work-directories-length -1
      ido-use-filename-at-point nil)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; (add-to-list 'auto-mode-alist '("\\.c\\'"   . sm-c-mode))
;; (add-to-list 'auto-mode-alist '("\\.cpp\\'" . sm-c-mode))
;; (add-to-list 'auto-mode-alist '("\\.h\\'"   . sm-c-mode))
;; (add-to-list 'auto-mode-alist '("\\.hpp\\'" . sm-c-mode))

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"   . web-mode))

;; Smooth Scroll
(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-mode 1)
(setq sublimity-scroll-weight 10
      sublimity-scroll-drift-length 5)

;; Org mode
(require 'org)

;; General settings
(setq display-line-numbers-type 'relative)
(setq-default display-line-numbers-width 3)
(setq resize-mini-windows nil)
(transient-mark-mode 1)
(setq split-height-threshold 20)
(setq split-width-threshold 80)
(setq truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default global-tab-width 4)
(electric-pair-mode t)
(setq switch-to-buffer-preserve-window-point t)
(setq-default truncate-lines t)
(global-visual-line-mode 1)
(show-paren-mode -1)
(global-hl-todo-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq dired-listing-switches "-al --group-directories-first")
(display-time)
;; (set-frame-font "Hermit 16" nil t)
;; (set-frame-font "Inconsolata 16" nil t)
(set-frame-font "Consolas 16" nil t)
(setq-default fill-column 80) ; for the 80 column range formatting
(setq compile-command "build.bat")
(setq custom-file "~/.emacs.d/.emacs-custom.el")

(setq c-basic-offset 4)
(setq cpp-basic-offset 4)

(setq shell-file-name "pwsh")
(setq explicit-shell-file-name "pwsh")
(setq explicit-pwsh.exe-args '("-NoLogo"))

;; Unset Keybindings
(global-unset-key (kbd "C-x C-b"))
(global-unset-key (kbd "C-x C-k RET"))
(global-unset-key (kbd "C-x f"))
(global-unset-key (kbd "C-x C-l"))
(global-unset-key (kbd "C-x C-d"))
(global-unset-key (kbd "C-x d"))
(global-unset-key (kbd "C-x o"))

;; Keybindings
(global-set-key (kbd "C-3") 'split-window-right)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-x C-l") 'display-line-numbers-mode)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-,") 'other-window)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand) 
(global-set-key (kbd "M-/") 'hippie-expand)

(load-theme 'base16-ashes)
(setq custom-safe-themes t)

;; Some utilility functions
(defun insert-random-number (max)
  "Insert a random number between 0 and MAX-1 at point."
  (interactive "nEnter the maximum value: ")
  (let ((random-number (random max)))
    (insert (number-to-string random-number))))

(defun insert-random-float ()
  "Insert a random floating-point number between 0 and 1 at point."
  (interactive)
  (let ((random-float (/ (float (random most-positive-fixnum)) most-positive-fixnum)))
    (insert (format "%.2ff" random-float))))

(defun build-project ()
  "Search for build.bat file in the current directory or parent directories and run it."
  (interactive)
  (let ((build-file (locate-dominating-file default-directory "build.bat")))
    (if build-file
        (compile (concat build-file "build.bat"))
      (message "No build.bat found in project."))))

(global-set-key (kbd "M-b") 'build-project)
(global-set-key (kbd "M-n") 'next-error)

