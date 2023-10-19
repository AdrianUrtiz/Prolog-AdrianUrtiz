;;Escriba un programa para determinar si un solicitante puede lograr un
;;préstamo. Deberá pedir los siguientes datos para cada solicitante:
;;Nombre, historial(‘b’buena o ‘m’ mala), cantidad,
;;salario anual, y valor de propiedades.  El banco solo
;;considerará a los solicitantes con un estado de crédito bueno.  De
;;aquellos, solo aceptara los que tengan mas de 6 puntos.  Los puntos
;;se obtienen como sigue: 5 puntos si el salario es 50% del préstamo o
;;más.  3 puntos si el salario es por lo menos 25% pero menos de 50%
;;del préstamo.  1 punto si el salario es por lo menos 10% pero menos
;;de 25% del préstamo.  5 puntos si se tiene otra propiedad del doble
;;del préstamo o mas.  3 puntos si se tiene otra propiedad igual al
;;préstamo pero menor del doble.

(defun calcular (salario cantidad propiedades)
  (let ((puntos 0))
    (cond ((>= salario (* 0.5 cantidad)) (setq puntos (+ puntos 5)))
          ((>= salario (* 0.25 cantidad)) (setq puntos (+ puntos 3)))
          ((>= salario (* 0.1 cantidad)) (setq puntos (+ puntos 1))))
    (cond ((>= propiedades (* 2 cantidad)) (setq puntos (+ puntos 5)))
          ((>= propiedades cantidad) (setq puntos (+ puntos 3))))
    puntos))

(defun datos ()
  (format t "Nombre del solicitante: ")
  (setq nombre (read-line))
  
  (format t "Historia crediticia (b/buena o m/mala): ")
  (setq historial (read-line))
  
  (format t "Cantidad pedida: ")
  (setq cantidad (parse-integer (read-line)))
  
  (format t "Salario anual: ")
  (setq salario (parse-integer (read-line)))
  
  (format t "Valor de propiedades: ")
  (setq propiedades (parse-integer (read-line)))
  
  (if (equal historial "b")
      (let ((puntos (calcular salario cantidad propiedades)))
        (if (>= puntos 6)
            (format t "¡El solicitante ~a es elegible para el préstamo con ~a puntos!~%" nombre puntos)
            (format t "El solicitante ~a no es elegible para el préstamo con ~a puntos~%" nombre puntos)))
      (format t "El solicitante ~a tiene un historial malo y no es elegible para el préstamo~%" nombre)))

(datos)