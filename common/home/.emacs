;; dir to store all extra extensions
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq vendor-dir (concat dotfiles-dir "/.emacs.d/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; PACKAGES
;;--------------------------------------------------
(defvar my-packages
  '(starter-kit
    starter-kit-lisp
    starter-kit-bindings
    starter-kit-ruby
    starter-kit-eshell
    starter-kit-js
    go-mode
    clojure-mode
    clojure-test-mode
    clojurescript-mode
    expectations-mode
    expand-region
    rainbow-delimiters
    auto-complete
    cider
    ac-nrepl)
  "A list of packages to ensure are installed at launch.")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(require 'melpa)
(setq package-archive-enable-alist '(("melpa" clojure-mode clojure-test-mode cider)))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (p my-packages)
  (unless (package-installed-p p)
   (condition-case err
    (package-install p)
    (error (message "%s" (error-message-string err))))))

;; ENVIRONMENT
;;--------------------------------------------------

; (scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))


;; CODING STYLES
;;--------------------------------------------------

(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)

;; smooth-scrolling stops that annoying jump when moving around
(require 'smooth-scrolling)

;; makes sexps flash when you eval them!
(require 'highlight)
(require 'eval-sexp-fu)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; ready clojure setup
(require 'clojure-mode)
(require 'clojure-test-mode)
(require 'cider)

;; clojure-mode configuration
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; cider (formerly nrepl.el) configuration
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; ac-nrepl (and nrepl autocomplete) configuration
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
(eval-after-load "cider"
   '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Monospace"
                    :height 120)

;; show line numbers
(when window-system (global-linum-mode t))

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq css-indent-offset 2)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;; CUSTOM FUNCTIONS
;;--------------------------------------------------

(require 'ti-services)
(require 'ti-utils)

;; half height scrolling
;;

(defun window-half-height ()
    (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
    (interactive)
      (scroll-up (window-half-height)))

(defun scroll-down-half ()
    (interactive)
      (scroll-down (window-half-height)))

(global-set-key "\C-v" 'scroll-up-half)
(global-set-key "\M-v" 'scroll-down-half)

;; KEYBINDINGS
;;--------------------------------------------------

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)

;; where did this go in esk?
(global-set-key (kbd "C-x \\") 'align-regexp)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; fix the Shift + up arrow to move between windows
(define-key input-decode-map "\e[1;2A" [S-up])

;; expand-region
(global-set-key (kbd "C-x 9") 'er/expand-region)
;; (global-set-key (kbd "C-x 0") 'er/contract-region)
