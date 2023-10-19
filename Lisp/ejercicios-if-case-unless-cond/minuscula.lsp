;;Escriba un programa que pida una letra minúscula, el programa deberá
;;imprimir si la letra es una vocal (a,e,i,o,u), semivocal (y) o una
;;consonante.

(defun minuscula ()
  (format t "Ingresa una letra minúscula: ")
  (let ((letra (read-char)))
    (cond
      ((or (char= letra #\a)
           (char= letra #\e)
           (char= letra #\i)
           (char= letra #\o)
           (char= letra #\u))
       (format t "La letra ~a es una vocal.~%" letra))
      ((char= letra #\y)
       (format t "La letra ~a es una semivocal.~%" letra))
      ((and (>= (char-code letra) (char-code #\a))
            (<= (char-code letra) (char-code #\z)))
       (format t "La letra ~a es una consonante.~%" letra))
      (t
       (format t "No es una letra minúscula válida.~%")))))

(minuscula)

