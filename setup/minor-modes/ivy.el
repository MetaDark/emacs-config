(use-package ivy
  :straight t
  :after flx
  :init
  (ivy-mode)

  :config
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :straight t
  :after amx
  :bind (:map counsel-describe-map
              ("M-." . counsel-find-symbol))
  :init
  (counsel-mode)

  :config
  (add-to-list 'ivy-sort-functions-alist '(counsel-fzf . nil)))

;; Used to sort ivy fuzzy search results
(use-package flx
  :straight t)

;; Used to prioritize commonly used counsel-M-x commands
(use-package amx
  :straight t)
