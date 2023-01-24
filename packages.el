;;; packages.el --- zotero layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Selwyn Simsek
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defconst zotero-packages '(zotxt))

(defun zotero/init-zotxt ()
  "Inspired by <http://www.mkbehr.com/posts/a-research-workflow-with-zotero-and-org-mode/>."
  (add-hook 'org-mode-hook (lambda () (org-zotxt-mode 1)))
  ;; Bind something to replace the awkward C-u C-c " i
  (define-key org-mode-map
              (kbd "C-c \" \"") (lambda () (interactive)
                                  (org-zotxt-insert-reference-link '(4))))
  ;; Change citation format to be less cumbersome in files.
  ;; You'll need to install mkbehr-short into your style manager first.
  (eval-after-load "zotxt"
    '(setq zotxt-default-bibliography-style "mkbehr-short")))
