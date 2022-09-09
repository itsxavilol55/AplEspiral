public class App
// Nombre: Lopez Ontiveros Javier Eduardo
// materia: topicos avanzados de programacion
// semestre: 5to
// maestro: Clemente Garcia Gerardo
{
    public static void main(String[] args) throws Exception
    {
        espiral s = new espiral();
        s.formar();
        s.imprimir();
        espiral s2 = new espiral(15);
        s2.formar();
        s2.imprimir();
    }
}
