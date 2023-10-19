function encontrarSalidaLaberinto(laberinto) {
    // Definir las direcciones posibles: arriba, abajo, izquierda, derecha
    const direcciones = [[-1, 0], [1, 0], [0, -1], [0, 1]];

    // Función auxiliar para verificar si una celda es válida
    function esCeldaValida(x, y) {
        return (
            x >= 0 &&
            x < laberinto.length &&
            y >= 0 &&
            y < laberinto[0].length &&
            laberinto[x][y] === 0
        );
    }

    // Función recursiva para buscar la salida
    function buscar(x, y) {
        if (!esCeldaValida(x, y)) {
            return false;
        }

        // Marcar la celda como visitada
        laberinto[x][y] = 2;

        // Si estamos en la salida, hemos encontrado la solución
        if (x === laberinto.length - 1 && y === laberinto[0].length - 1) {
            return true;
        }

        // Intentar moverse en las cuatro direcciones
        for (const direccion of direcciones) {
            const nuevaX = x + direccion[0];
            const nuevaY = y + direccion[1];
            if (buscar(nuevaX, nuevaY)) {
                return true;
            }
        }

        // Si no se encontró la salida desde esta celda, retroceder
        laberinto[x][y] = 0;
        return false;
    }

    // Llamar a la función de búsqueda desde la celda de inicio (0, 0)
    if (buscar(0, 0)) {
        return laberinto;
    } else {
        return "No se encontró una salida.";
    }
}

// Ejemplo de uso:
const laberinto = [
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0],
];

const solucion = encontrarSalidaLaberinto(laberinto);
console.log(solucion);