(require 'cc-mode)

(defun kls-c-mode-hook ()
  (c-set-style "k&r")
  (turn-on-auto-fill)
  (c-toggle-auto-hungry-state 1)
  (c-set-offset 'inline-open 0)
  (setq tab-width 8
	c-basic-offset 4
	indent-tabs-mode nil
	c-echo-syntactic-information-p t
	c-cleanup-list '(empty-defun-braces
			 defun-close-semi)))

(add-hook 'c-mode-hook 'kls-c-mode-hook)

(defun kls-c++-mode-hook ()
  (c-set-style "stroustrup")
  (turn-on-auto-fill)
  (c-toggle-auto-hungry-state 1)
  (c-set-offset 'inline-open 0)
  (setq tab-width 8
	c-basic-offset 4
	indent-tabs-mode nil
	c-echo-syntactic-information-p t
	c-cleanup-list '(scope-operator
			 empty-defun-braces
			 defun-close-semi))
  (define-key c++-mode-map "\C-cc" 'compile))

(add-hook 'c++-mode-hook 'kls-c++-mode-hook)
(provide 'kls-c)