;;; kls-web.el --- html, js and css hooks for KLS

;; Copyright (C) 2012-15, Kurt Sorge.

;; Author: Kurt Sorge <klsorge@gmail.com>
;; Keywords:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;

;;; Code:

(require 'kls-common)
(defvar kls-js2-mode-installed (kls-require 'js2-mode))
(defvar kls-moz-installed (kls-require 'moz))
;; (defvar kls-slime-js-installed (kls-require 'slime-js))

(defun kls-js2-mode-hook ()
  (if kls-moz-installed (moz-minor-mode 1)))

(add-hook 'js2-mode-hook 'kls-js2-mode-hook)

(if kls-js2-mode-installed
    (setq auto-mode-alist
          (append (list '("\\.js$" . js2-mode)
                        '("\\.json$" . js2-mode))
                  auto-mode-alist)))

(provide 'kls-web)
