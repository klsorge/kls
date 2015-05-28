;;; kls-c.el --- C/C++ mode hooks for KLS

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
