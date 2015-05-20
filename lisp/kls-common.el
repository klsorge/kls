(defun kls-upfirst (str)
  "Ensure the first character of a string is upper case."
  (concat (upcase (substring str 0 1))
	  (substring str 1)))

(defun kls-downfirst (str)
  "Ensure the first character of a string is lower case."
  (concat (downcase (substring str 0 1))
	  (substring str 1)))

(defun kls-parent-directory (path)
  "Get the paret directory of an entry path. Entry can be a file or directory"
  (file-name-directory (directory-file-name path)))

(defun kls-find-file-upwards (path file)
  "Run up the directory tree looking for a file and then return the
  full pathname. If it gets to the root directory and the file is not
  found nil is returned instead."
  (cond
   ;; If we are at the top directory return nil
   ((equal path (kls-parent-directory path)) nil)
   ;; If we have found the file return it
   ((file-exists-p (concat path file)) (concat path file))
   ;; Otherwise recurse up the directory tree and try again
   (t (kls-find-file-upwards (kls-parent-directory path) file))))

(defun kls-os-p (id)
  "Use the `system-type' to determine the os of the system."
  (string-equal system-type id))

(defun kls-os-w32-p ()
  "Is this environment running on a Micosoft Windows platform?"
  (kls-os-p "windows-nt"))

(defun kls-os-mac-p ()
  "Is this environment running on a Macintosh platform?"
  (kls-os-p "darwin"))

(defun kls-os-linux-p ()
  "Is this environment running on a GNU/Linux platform?"
  (kls-os-p "gnu/linux"))

(defun kls-require (feature &optional filename)
  "Works similar to `require' with NOERROR set to non-nil except
  that it will log a message to the *Message* buffer when the
  feature is not found."
  (if (require feature filename t)
      feature
    (message (format "Loading %s... failed: library not found" feature))
    nil))

(provide 'kls-common)