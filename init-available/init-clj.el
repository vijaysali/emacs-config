(require 'packages)
(install-packages '(clojure-mode
                    clojure-test-mode
                    cider
                    paredit))

;; cljojure stuff
(require 'clj-parenface)
(add-hook 'clojure-mode-hook 'tweak-clojure-syntax)

(provide 'init-clj)
