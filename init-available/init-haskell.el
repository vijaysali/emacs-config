(require 'packages)
(install-packages '(haskell-mode))
(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'haskell-indent-mode)

(provide 'init-haskell)
