(defun kls-shell-mode-hook ()
  (ansi-color-for-comint-mode-on))

(add-hook 'shell-mode-hook 'kls-shell-mode-hook)
(provide 'kls-shell)
