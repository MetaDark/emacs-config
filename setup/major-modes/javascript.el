(use-package js2-mode
  :straight t
  :commands (js2-mode)
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (with-eval-after-load 'restclient
    (add-to-list 'restclient-media-type-mode-alist '("\\`application/js\\'" . js2-mode))))

(use-package json-mode
  :straight t
  :commands (json-mode)
  :magic-fallback "^[{[]$" ;; TODO: push this as an autoload upstream
  :init
  (with-eval-after-load 'restclient
    (add-to-list 'restclient-media-type-mode-alist '("\\`application/json\\'" . json-mode))))

(use-package tern
  :straight t
  ;; :ensure-system-package tern
  :commands (tern-mode)
  :diminish " ◎"
  :init
  (with-eval-after-load 'js2-mode
    (add-hook 'js2-mode-hook 'tern-mode))

  (defun tern-setup-project-browser ()
    "Setup a new browser tern project"
    (interactive)
    (let ((source (concat dir/conf "browser.tern-project"))
          (dest (concat default-directory ".tern-project")))
      (copy-file source dest)
      (find-file dest)))

  (defun tern-setup-project-node ()
    "Setup a new node.js tern project"
    (interactive)
    (let ((source (concat dir/conf "node.tern-project"))
          (dest (concat default-directory ".tern-project")))
      (copy-file source dest)
      (find-file dest))))

(use-package company-tern
  :straight t
  :commands (company-tern)
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-tern)))
