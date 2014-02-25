(deftheme gentooish "Brian carper's gentooish")

(custom-theme-set-faces
 'gentooish
 '(bold ((t (:foreground "white" :weight normal))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "#c476f1"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "grey30" :slant italic))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#4cbbd1"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#9a383a"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "#9a383a"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:background "#0f291a" :foreground "#5dff9e"))))
 '(hi-blue ((((background dark)) (:background "grey20"))))
 '(ido-first-match ((t (:background "#361d45" :foreground "#cf7dff" :weight bold))))
 '(ido-only-match ((((class color)) (:background "#361d45" :foreground "#cf7dff" :weight bold))))
 '(ido-subdir ((((min-colors 88) (class color)) (:foreground "#7dcfff"))))
 '(linum ((t (:inherit shadow :background "grey12"))))
 '(minibuffer-prompt ((((background dark)) (:foreground "#863335"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "#333333" :foreground "#ffffff" :box (:line-width -1 :color "#333333")))))
 '(mode-line-highlight ((((class color) (min-colors 88)) nil)))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background dark)) (:foreground "#8b8b8b" :weight light))))
 '(show-paren-match ((((class color) (background dark)) (:background "#005500"))))
 '(tool-bar ((default (:foreground "black")) (((type x w32 ns) (class color)) (:background "grey75")))))

(provide-theme 'gentooish)

(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
