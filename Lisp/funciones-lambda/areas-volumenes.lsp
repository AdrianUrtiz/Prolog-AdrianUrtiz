(defvar *area* (lambda (a b) (* a b)))

(defun datos()
  (princ "Dame dato")
  (setq a (read))
  (princ "Dame otro")
  (setq b (read))
  (format t "El resultado es ~A"(funcall *area* a b))

)
(datos)



