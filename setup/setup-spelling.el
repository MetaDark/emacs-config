;; sudo pacman -S aspell aspell-en
(setq ispell-program-name "aspell")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(c-mode-common-hook emacs-lisp-mode-hook lisp-mode-hook))
  (flyspell-prog-mode))

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)

(provide 'setup-spelling)
