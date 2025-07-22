package stypcanto.com.Lab07;

// Importa las clases necesarias del paquete Jakarta Servlet para manejar peticiones HTTP y excepciones
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

// Define que esta clase es un servlet accesible mediante la URL /calcula
@WebServlet("/calcula")
public class CalculaServlet extends HttpServlet {

    // Sobrescribe el método doGet para procesar peticiones HTTP GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtiene el parámetro 'figura' que indica qué figura se desea calcular
        String figura = request.getParameter("figura");

        // Establece el tipo de contenido que se devolverá al cliente como texto plano
        response.setContentType("text/plain");

        // Evalúa qué figura se solicitó para calcular su volumen
        switch (figura) {
            case "cubo":
                // Lee el parámetro 'lado', lo convierte a double
                double lado = Double.parseDouble(request.getParameter("lado"));
                // Calcula el volumen del cubo (lado^3)
                double volumenCubo = Math.pow(lado, 3);
                // Envía la respuesta con el resultado del volumen
                response.getWriter().println("Volumen del cubo: " + volumenCubo);
                break;

            case "esfera":
                // Lee el parámetro 'radio', lo convierte a double
                double radio = Double.parseDouble(request.getParameter("radio"));
                // Calcula el volumen de la esfera: (4/3)*π*radio^3
                double volumenEsfera = (4.0 / 3.0) * Math.PI * Math.pow(radio, 3);
                // Envía la respuesta con el resultado del volumen
                response.getWriter().println("Volumen de la esfera: " + volumenEsfera);
                break;

            case "cilindro":
                // Lee los parámetros 'radio' y 'altura', los convierte a double
                double radioC = Double.parseDouble(request.getParameter("radio"));
                double altura = Double.parseDouble(request.getParameter("altura"));
                // Calcula el volumen del cilindro: π*radio^2*altura
                double volumenCilindro = Math.PI * Math.pow(radioC, 2) * altura;
                // Envía la respuesta con el resultado del volumen
                response.getWriter().println("Volumen del cilindro: " + volumenCilindro);
                break;

            // Caso para cualquier figura no reconocida o parámetro incorrecto
            default:
                response.getWriter().println("Figura no válida");
        }
    }
}
