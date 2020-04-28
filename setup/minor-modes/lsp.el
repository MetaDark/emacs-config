(use-package lsp-mode
  :straight t
  :bind (:map lsp-mode-map
              ("C-r" . lsp-rename))
  :config
  (setq lsp-enable-file-watchers nil) ;; file watchers cause emacs to hang on large projects
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)
  (setq lsp-response-timeout 1.0e+INF))

(use-package lsp-ui
  :straight t
  :hook (lsp-mode . lsp-ui-mode)
  :bind (:map lsp-ui-mode-map
              ("M-." . lsp-ui-peek-find-definitions)
              ("C-M-." . lsp-find-definition)
              ("M-/" . lsp-ui-peek-find-references)
              ("C-M-/" . lsp-find-references)
              ("M-?" . lsp-ui-doc-mode)
              ("C-M-?" . lsp-ui-doc-enable-focus-frame))
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-sideline-enable t)

  (defun lsp-ui-doc-enable-focus-frame ()
    (interactive)
    (lsp-ui-doc-enable t)
    (lsp-ui-doc-show)
    (lsp-ui-doc-focus-frame)))
