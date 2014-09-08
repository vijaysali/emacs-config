;; Dusk Colour Theme for Emacs.
;;
(deftheme dusk "twilight fork")

(custom-theme-set-faces
 'dusk
 '(default
    ((t (:inherit nil :stipple nil :background "black" :foreground "gray75" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "olive drab"))))
 '(blue ((t (:foreground "blue"))))
 '(bold ((t (:bold t))))
 '(bold-italic ((t (:bold t))))
 '(border-glyph ((t (nil))))
 '(buffers-tab ((t (:background "black" :foreground "white"))))
 '(font-lock-builtin-face ((t (:foreground "tomato4"))))
 '(font-lock-comment-face ((t (:foreground "#5F5A60"))))
 '(font-lock-constant-face ((t (:foreground "#CF6A4C"))))
 '(font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
 '(font-lock-function-name-face ((t (:foreground "#9B703F"))))
 '(font-lock-keyword-face ((t (:foreground "#CDA978"))))
 '(font-lock-preprocessor-face ((t (:foreground "olive drab"))))
 '(font-lock-reference-face ((t (:foreground "SlateBlue"))))

 '(font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "red"))))

 '(font-lock-string-face ((t (:foreground "#8F9D6A"))))
 '(font-lock-type-face ((t (:foreground "#9B703F"))))
 '(font-lock-variable-name-face ((t (:foreground "#7587A6"))))
 '(font-lock-warning-face ((t (:bold t :foreground "Pink"))))
 '(gui-element ((t (:background "#303030" :foreground "black"))))
 '(region ((t (:background "#444444"))))
 '(mode-line ((t (:background "#303030" :foreground "black" :box (:line-width 1 :color "SteelBlue4")))))
 '(highlight ((t (:background "#222222"))))
 '(highline-face ((t (:background "DeepSkyBlue4" :foreground "white"))))
 '(italic ((t (nil))))
 '(left-margin ((t (nil))))
 '(cursor ((t (:background "yellow"))))
 '(toolbar ((t (nil))))
 '(underline ((nil (:underline nil))))
 '(minibuffer-prompt ((t (:foreground "DeepSkyBlue2" :background "black" :weight bold))))
 '(zmacs-region ((t (:background "snow" :foreground "ble")))))

(provide-theme 'dusk)

(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
