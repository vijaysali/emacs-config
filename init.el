(defvar my-packages '(clojure-mode
                      clojure-test-mode
                      cider
                      tuareg ;; ocaml mode
                      erlang
                      escreen
                      twilight-theme
                      rainbow-delimiters
                      tango-2-theme))

(progn
  (add-to-list 'load-path (expand-file-name "~/.emacs.d") t)
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/themes") t)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq inhibit-startup-screen t)

  (require 'package)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  (when (not (file-exists-p "~/.emacs.d/elpa/archives"))
    (package-refresh-contents))

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(load "escreen")
(escreen-install)

(load-theme 'dusk t)

(global-set-key (kbd "M-1") 'escreen-goto-screen-0)
(global-set-key (kbd "M-2") 'escreen-goto-screen-1)
(global-set-key (kbd "M-3") 'escreen-goto-screen-2)
(global-set-key (kbd "M-4") 'escreen-goto-screen-3)
(global-set-key (kbd "M-5") 'escreen-goto-screen-4)
(global-set-key [S-right] 'escreen-goto-next-screen)
(global-set-key [S-left]  'escreen-goto-prev-screen)

(global-set-key [C-right] 'escreen-goto-next-screen)
(global-set-key [C-left]  'escreen-goto-prev-screen)

;; cljojure stuff 
(require 'clj-parenface)
(add-hook 'clojure-mode-hook 'tweak-clojure-syntax)

;; ruby stuff
;;
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; dired mode

(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
        (progn
          (set (make-local-variable 'dired-dotfiles-show-p) nil)
          (message "h")
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
             (set (make-local-variable 'dired-dotfiles-show-p) t)))))
