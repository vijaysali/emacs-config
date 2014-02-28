(defvar my-packages '(color-theme
                      clojure-mode
                      clojure-test-mode
                      cider
                      slime
                      auto-complete
                      tuareg 
                      paredit
                      erlang
                      escreen
                      rainbow-delimiters
                      jump
                      highline
                      dired-details
                      wdired
                      json-mode
                      markdown-mode
                      textile-mode))

(progn
  (add-to-list 'load-path (expand-file-name "~/.emacs.d") t)
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/init-enabled") t)
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

(mapc (lambda (name)
        (require (intern (file-name-sans-extension name))))
      (directory-files ".emacs.d/init-enabled" nil "\\.el$"))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
