;;; kls-lisp.el --- Lisp mode hooks for KLS

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


(defun kls-lisp-mode-hook()
  (turn-on-auto-fill)
  (setq tab-width 8
	indent-tabs-mode nil)
  (define-key lisp-mode-shared-map "\C-cc" 'byte-compile-file))

(add-hook 'emacs-lisp-mode-hook 'kls-lisp-mode-hook)
(add-hook 'lisp-mode-hook 'kls-lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'kls-lisp-mode-hook)

(provide 'kls-lisp)
