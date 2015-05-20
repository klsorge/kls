
(defun kls-lisp-mode-hook()
  (turn-on-auto-fill)
  (setq tab-width 8
	indent-tabs-mode nil)
  (define-key lisp-mode-shared-map "\C-cc" 'byte-compile-file))

(add-hook 'emacs-lisp-mode-hook 'kls-lisp-mode-hook)
(add-hook 'lisp-mode-hook 'kls-lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'kls-lisp-mode-hook)

(provide 'kls-lisp)