;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("section" "** ${1:section}\n*** Table of Content\n    1. +[[$2]]\n    *** $2" "section" t nil nil "/home/henri/.config/doom/snippets/org-mode/section" nil "t")
                       ("chapter" "* ${1:chapter}\n** Table of Content\n   1. +[[$2]]\n** $2\n*** ${3:sub-section}\n" "chapter" nil nil nil "/home/henri/.config/doom/snippets/org-mode/chapter" nil nil)))


;;; Do not edit! File generated at Tue May 30 14:56:03 2023
