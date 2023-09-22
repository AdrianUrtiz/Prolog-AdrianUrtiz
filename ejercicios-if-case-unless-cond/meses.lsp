;;Escriba un programa que pida el numero de mes (del 1 al 12 ) e
;;   imprima el numero de dias que tiene el mes, donde:
;;
;;   • El mes 2 tiene 28 dias
;;   • Los meses 4,6,9 y 11 tienen 30 dias
;;   • Los meses 1,3,5,7,8,10 y 12 tienen 31 dias
;;
;;   Si da un mes diferente a los anteriores debera imprimir el mensaje
;;   “MES ERRONEO”.

(defun meses (mes)
  (case mes
    ((1 3 5 7 8 10 12) (format t "El mes ~A tiene 31 días.~%" mes))
    ((4 6 9 11) (format t "El mes ~A tiene 30 días.~%" mes))
    ((2) (format t "El mes ~A tiene 28 días.~%" mes))
    (t (format t "MES ERRONEO.~%"))))

(format t "Ingresa un número de mes (del 1 al 12): ")
(let ((mes (read)))
(meses mes))
