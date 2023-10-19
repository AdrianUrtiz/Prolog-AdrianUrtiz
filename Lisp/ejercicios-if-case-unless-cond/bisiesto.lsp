; Para determinar si un año es bisiesto o no debe de cumplir las
; siguiente regla: Ser divisible entre 4 y no divisible entre 100 o
; bien divisible entre 400.  Escriba un programa que pida como entrada
; el año e imprima si el año es bisiesto o no.

(defun es-bisiesto (year)
  (cond
    ((and (= (mod year 4) 0) (not (= (mod year 100) 0)))
     t)
    ((= (mod year 400) 0)
     t)
    (t
     nil)))

(defun main ()
  (format t "Ingrese un año: ")
  (let ((year (parse-integer (read-line))))
    (if (es-bisiesto year)
        (format t "~a es un año bisiesto~%" year)
        (format t "~a no es un año bisiesto~%" year))))

(main)
