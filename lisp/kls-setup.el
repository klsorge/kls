(require 'kls-common)
(require 'bookmark)
(kls-require 'dvc-autoloads)        ; load distributed version control
(kls-require 'psvn)                 ; load subversion integration
(kls-require 'quack)                ; load Scheme integration

(defvar kls-slime-installed (kls-require 'slime))

;; Setup the .emacs.d directory
(defun kls-setup-emacsd ()
  "Setup the `.emacs.d' directory."
  (setq backup-by-copying t
        backup-directory-alist 
        '(("." . "~/.emacs.d/auto-save-backup"))
        bookmark-default-file "~/.emacs.d/bookmarks"
        delete-old-versions nil
        version-control nil))

;; Setup startup and display
(defun kls-setup-display ()
  "Setup the mode-line, font-lock and other display type variables."
  (setq-default major-mode 'text-mode)
  (setq inhibit-startup-message t
        column-number-mode t
        x-select-enable-clipboard t)
  (tool-bar-mode -1)
  (display-time)
  (cond ((fboundp 'global-font-lock-mode)
         (global-font-lock-mode t)
         (setq font-lock-maximum-decoration t)))
  (transient-mark-mode t)
  (put 'scroll-left 'disabled nil))

(defun kls-setup ()
  "The master setup function for KLS"
  (if kls-slime-installed
      (slime-setup '(slime-fancy)))
  (kls-setup-emacsd)
  (kls-setup-display))

;; Add local libraries
(require 'kls-c)
(require 'kls-java)
(require 'kls-shell)
(require 'kls-lisp)
(provide 'kls-setup)
