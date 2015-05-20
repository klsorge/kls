(require 'kls-common)
(require 'cc-mode)
(require 'compile)
(require 'cl)

(defvar kls-java-mode-indent-annotations-installed
  (kls-require 'java-mode-indent-annotations))

(defun kls-java-mode-hook ()
  (c-set-style "java")
  (turn-on-auto-fill)
  (c-toggle-auto-hungry-state 1)
;  (c-set-offset 'statement-cont 0)
  (c-set-offset 'substatement-open 0)
  ;; (c-set-offset 'topmost-intro-cont 0)
  (c-set-offset 'func-decl-cont '++)
  (c-set-offset 'inher-intro '++)
  (setq tab-width 8
	indent-tabs-mode t
	c-echo-syntactic-information-p t
	c-basic-offset 4
	c-hanging-braces-alist '((class-open after)
                                 (defun-open after)
				 (inline-open after)
				 (inclass-open after)
				 (substatement-open after)
                                 (inexpr-class-open after)
				 (block-close . c-snug-do-while))
	c-cleanup-list '(empty-defun-braces))
    (if kls-java-mode-indent-annotations-installed
      (java-mode-indent-annotations-setup)))

(add-hook 'java-mode-hook 'kls-java-mode-hook)

(defun ant ()
  "Compile this files project. It will look up the directory tree
  until it finds the first \"build.xml\" file to use for compiling."
  (interactive)
  (if buffer-file-name
      (let ((build-file (kls-find-file-upwards
                         (kls-parent-directory buffer-file-name) "build.xml")))
        (if (not build-file)
            (message "No build.xml found")
          (compile (read-from-minibuffer
                    "Ant Command: "
                    (concat "ant -e -f \"" build-file "\" ")))))
    (error "Buffer is not a file.")))
(provide 'ant)

(defun mvn ()
  "Compile this files project. It will look up the directory tree
  until it finds the first \"pom.xml\" file to use for compiling."
  (interactive)
  (if buffer-file-name
      (let ((build-file (kls-find-file-upwards
                         (kls-parent-directory buffer-file-name) "pom.xml")))
        (if (not build-file)
            (message "No pom.xml found")
          (compile (read-from-minibuffer
                    "Maven command: "
                    (concat "mvn -f \"" build-file "\" ")))))
    (message "Cannot search for pom.xml from %s" (buffer-name))))
(provide 'mvn)

;; (defun parent-directory (path)
;;   "Get the paret directory of an entry path. Entry can be a file or directory"
;;   (file-name-directory (directory-file-name path)))

;; (defun find-file-upwards (path file)
;;   "run up the directory tree looking for a file and then return the
;;   full pathname. If it gets to the root directory and the file is not
;;   found nil is returned instead."
;;   (cond
;;    ;; If we are at the top directory return nil
;;    ((equal path (parent-directory path)) nil)
;;    ;; If we have found the file return it
;;    ((file-exists-p (concat path file)) (concat path file))
;;    ;; Otherwise recurse up the directory tree and try again
;;    (t (find-file-upwards (parent-directory path) file))))

(add-to-list 'compilation-error-regexp-alist
              '("^\\(/.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 1 2 3))



;; (add-to-list 'auto-mode-alist
;;              '("\\.jsp\\'" . html-mode))
(provide 'kls-java)