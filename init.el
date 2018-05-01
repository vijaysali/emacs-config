
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(progn
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/init-enabled") t)
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/themes") t)
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp") t)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  (setq
   frame-title-format '(buffer-file-name "%f" ("%b"))
   indent-tabs-mode nil
   inhibit-startup-screen t
   visible-bell nil
   echo-keystrokes 0.1
   font-lock-maximum-decoration t
   inhibit-startup-message t
   transient-mark-mode t
   shift-select-mode nil
   mouse-yank-at-point t
   require-final-newline t
   truncate-partial-width-windows nil
   uniquify-buffer-name-style 'forward)

  (tooltip-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (show-paren-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode t)
  (recentf-mode 0)

  (setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
  (setq delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t)

  (mapc (lambda (name)
	  (require (intern (file-name-sans-extension name))))
	(directory-files "~/.emacs.d/init-enabled" nil "\\.el$"))
  (setq custom-file "~/.emacs.d/emacs-custom.el")
  (when (file-exists-p custom-file)
    (load custom-file))
  (load-theme 'dusk)
  (set-face-attribute 'default nil :height 85))
(add-hook 'after-init-hook #'projectile-global-mode)
