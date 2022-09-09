// Nombre: Lopez Ontiveros Javier Eduardo
// materia: topicos avanzados de programacion
// semestre: 5to
// maestro: Clemente Garcia Gerardo
//tema: creacion de un espiral de numeros
public class espiral
{
    private int lado;// medida de un lado
    private int[][] matriz;
    public espiral(
        int lado)// constructor con parametros
    {
        this.lado = lado;
        matriz = new int[lado][lado];// [fila] [columna]
    }
    public espiral()// constructor sin parametros
    {
        this.lado = (int) (Math.random() * 90 + 11);
        matriz = new int[lado][lado];// [fila] [columna]
    }
    public void formar()
    {
        int indexY = 0;// coordenada y
        int indexX = 0;// coordenada x
        int numero = 1; // numero a mostrar
        for (int i = 0; i < Math.pow(matriz.length, 2); i++)
        {
            matriz[indexY][indexX] = numero; // numero
            // matriz[indexY][indexX] = i; // valor de orden
            if (indexX < matriz.length - numero && indexY == numero - 1)// rellena la primer fila desde (0,0) hasta (0,N)
                indexX++;
            else if (indexY < matriz.length - numero && indexX == matriz.length - numero)// rellena la ultima columna desde (0,N) hasta (N,N)
                indexY++;
            else if (indexX > -1 + numero && indexY == matriz.length - numero)// rellena la ultima fila desde (N,N) hasta (N,0)
                indexX--;
            else if (indexY >= 0 && indexX == numero - 1)// rellena la ultima columna desde (N,0) hasta (0,0)
            {
                if (indexY == numero && indexX == numero - 1)// en caso de ser el ultimo numero de cada espiral se mueve a la otra espiral
                {
                    numero++;
                    indexX++;
                } else indexY--;
            }
        }
    }
    public void imprimir()
    {
        for (int i = 0; i < matriz.length; i++)// filas
        {
            for (int j = 0; j < matriz.length; j++)// columnas
                System.out.printf(" %3d ", matriz[i][j]);
            System.out.println();
        }
        System.out.println();
    }
}
