(defun recorre (lista)
    (format t "~A-> ~% ~A" (car lista))
    (if lista
        (recorre (cdr lista))
    )
)
(recorre '(1 2 3 4 5 6 7 8 9 10))