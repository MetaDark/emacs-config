(require-package
 '(rust-mode
   racer
   company-racer
   flycheck-rust))

(require-binary
 '(racer))

(setq racer-cmd "/home/kurt/.cargo/bin/racer")
(setq racer-rust-src-path "/home/kurt/dev/public/rust/src/")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(provide 'language-rust)
