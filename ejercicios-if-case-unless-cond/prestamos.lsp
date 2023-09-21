;;Escriba un programa para determinar si un solicitante puede lograr un
;;préstamo. Deberá pedir los siguientes datos para cada solicitante:
;;Nombre, historia crediticia(‘b’buena o ‘m’ mala), cantidad pedida,
;;salario anual, y valor de otras propiedades.  El banco solo
;;considerará a los solicitantes con un estado de crédito bueno.  De
;;aquellos, solo aceptara los que tengan mas de 6 puntos.  Los puntos
;;se obtienen como sigue: 5 puntos si el salario es 50% del préstamo o
;;más.  3 puntos si el salario es por lo menos 25% pero menos de 50%
;;del préstamo.  1 punto si el salario es por lo menos 10% pero menos
;;de 25% del préstamo.  5 puntos si se tiene otra propiedad del doble
;;del préstamo o mas.  3 puntos si se tiene otra propiedad igual al
;;préstamo pero menor del doble.

(defun calcular-puntos (salario cantidad-pedido otras-propiedades)
  (let ((puntos 0))
    (cond ((>= salario (* 0.5 cantidad-pedido)) (setq puntos (+ puntos 5)))
          ((>= salario (* 0.25 cantidad-pedido)) (setq puntos (+ puntos 3)))
          ((>= salario (* 0.1 cantidad-pedido)) (setq puntos (+ puntos 1))))
    (cond ((>= otras-propiedades (* 2 cantidad-pedido)) (setq puntos (+ puntos 5)))
          ((>= otras-propiedades cantidad-pedido) (setq puntos (+ puntos 3))))
    puntos))

(defun validar-solicitante ()
  (format t "Nombre del solicitante: ")
  (setq nombre (read-line))
  
  (format t "Historia crediticia (b/buena o m/mala): ")
  (setq historia-crediticia (read-line))
  
  (format t "Cantidad pedida: ")
  (setq cantidad-pedido (parse-integer (read-line)))
  
  (format t "Salario anual: ")
  (setq salario (parse-integer (read-line)))
  
  (format t "Valor de otras propiedades: ")
  (setq otras-propiedades (parse-integer (read-line)))
  
  (if (equal historia-crediticia "b")
      (let ((puntos (calcular-puntos salario cantidad-pedido otras-propiedades)))
        (if (>= puntos 6)
            (format t "¡El solicitante ~a es elegible para el préstamo con ~a puntos!~%" nombre puntos)
            (format t "El solicitante ~a no es elegible para el préstamo con ~a puntos.~%" nombre puntos)))
      (format t "El solicitante ~a tiene una historia crediticia mala y no es elegible para el préstamo.~%" nombre)))

(validar-solicitante)