(use-package web-mode
  :straight t
  :mode "\\.html?\\'"
  :init
  (with-eval-after-load 'restclient
    (add-to-list 'restclient-content-type-modes '("text/html" . web-mode))))

(use-package web-beautify
  :straight t
  :defer t
  :init
  (with-eval-after-load 'js2-mode
    (define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

  (with-eval-after-load 'json-mode
    (define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

  (with-eval-after-load 'sgml-mode
    (define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

  (with-eval-after-load 'web-mode
    (define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

  (with-eval-after-load 'css-mode
    (define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))
