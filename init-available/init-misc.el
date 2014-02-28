
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))


(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(add-hook 'before-make-frame-hook 'turn-off-tool-bar)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(setq visible-bell nil
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat dotfiles-dir "places"))


;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Save a list of recent files visited.
(recentf-mode 0)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; ido-mode is like magic pixie dust!
;; (when (> emacs-major-version 21)
;;   (ido-mode t)
;;   (setq ido-enable-prefix nil
;;         ido-enable-flex-matching t
;;         ido-create-new-buffer 'always
;;         ido-use-filename-at-point 'guess
;;         ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")

(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; nxhtml stuff
(setq mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil)

;; Associate modes with file extensions

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))

(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
    (add-to-list 'grep-find-ignored-files "target")
    (add-to-list 'grep-find-ignored-files "*.class")))

;; Default to unified diffs
(setq diff-switches "-u")

;; Cosmetics

(set-face-background 'vertical-border "white")
(set-face-foreground 'vertical-border "white")

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

(eval-after-load 'mumamo
  '(eval-after-load 'zenburn
     '(ignore-errors (set-face-background
                      'mumamo-background-chunk-submode "gray22"))))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; Get around the emacswiki spam protection
(add-hook 'oddmuse-mode-hook
          (lambda ()
            (unless (string-match "question" oddmuse-post)
              (setq oddmuse-post (concat "uihnscuskc=1;" oddmuse-post)))))

(require 'jump)
(autoload 'defjump "jump-def" "Jump to a definition." t)

(require 'highline)
(defun highline-mode-on () (highline-mode 1))
(add-hook 'dired-after-readin-hook #'highline-mode-on)

(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")

(defun dired-lynx-keybindings ()
  (define-key dired-mode-map [left]  'dired-up-directory)
  (define-key dired-mode-map [right]  'dired-view-file))
(add-hook 'dired-mode-hook 'dired-lynx-keybindings)


(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(add-hook 'dired-load-hook
	(lambda ()
		(load "dired-x")
		;; Set dired-x global variables here.  For example:
		(setq dired-guess-shell-gnutar "rm")
		(setq dired-x-hands-off-my-keys nil)))


;; escreen
(load "escreen")
(escreen-install)
(global-set-key (kbd "M-1") 'escreen-goto-screen-0)
(global-set-key (kbd "M-2") 'escreen-goto-screen-1)
(global-set-key (kbd "M-3") 'escreen-goto-screen-2)
(global-set-key (kbd "M-4") 'escreen-goto-screen-3)
(global-set-key (kbd "M-5") 'escreen-goto-screen-4)
(global-set-key [S-right] 'escreen-goto-next-screen)
(global-set-key [S-left]  'escreen-goto-prev-screen)

(global-set-key [C-right] 'escreen-goto-next-screen)
(global-set-key [C-left]  'escreen-goto-prev-screen)

(setq resize-mini-windows nil)


(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

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


(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(provide 'init-misc)
