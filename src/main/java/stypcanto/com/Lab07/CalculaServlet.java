package stypcanto.com.Lab07;

// Importa las clases necesarias del paquete Jakarta Servlet para manejar peticiones HTTP y excepciones
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.DecimalFormat;

// Define que esta clase es un servlet accesible mediante la URL /calcula
@WebServlet("/calcula")
public class CalculaServlet extends HttpServlet {

    // Sobrescribe el método doGet para procesar peticiones HTTP GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



// Dentro de tu método doGet, antes del switch:
        DecimalFormat df = new DecimalFormat("0.#");
        df.setDecimalSeparatorAlwaysShown(false);
        // Hasta 2 decimales

        // Establece el tipo de contenido que se devolverá al cliente como texto plano
        response.setContentType("text/plain");

// Obtiene el parámetro 'figura' que indica qué figura se desea calcular
        String figura = request.getParameter("figura");
        if (figura == null || figura.isEmpty()) {
            response.getWriter().println("Error: parámetro 'figura' es obligatorio.");
            return;
        }

        // Evalúa qué figura se solicitó para calcular su volumen
        switch (figura) {
            case "cubo":
                String ladoStr = request.getParameter("lado");
                if (ladoStr == null || ladoStr.isEmpty()) {
                    response.getWriter().println("Error: parámetro 'lado' es obligatorio para cubo.");
                    return;
                }
                double lado = Double.parseDouble(ladoStr);
                double volumenCubo = Math.pow(lado, 3);
                response.getWriter().println("Volumen del cubo: " + df.format(volumenCubo));
                break;

            case "esfera":
                String radioStr = request.getParameter("radio");
                if (radioStr == null || radioStr.isEmpty()) {
                    response.getWriter().println("Error: parámetro 'radio' es obligatorio para esfera.");
                    return;
                }
                double radio = Double.parseDouble(radioStr);
                double volumenEsfera = (4.0 / 3.0) * Math.PI * Math.pow(radio, 3);
                response.getWriter().println("Volumen de la esfera: " + df.format(volumenEsfera));
                break;

            case "cilindro":
                String radioCStr = request.getParameter("radio");
                String alturaStr = request.getParameter("altura");
                if (radioCStr == null || radioCStr.isEmpty() || alturaStr == null || alturaStr.isEmpty()) {
                    response.getWriter().println("Error: parámetros 'radio' y 'altura' son obligatorios para cilindro.");
                    return;
                }
                double radioC = Double.parseDouble(radioCStr);
                double altura = Double.parseDouble(alturaStr);
                double volumenCilindro = Math.PI * Math.pow(radioC, 2) * altura;
                response.getWriter().println("Volumen del cilindro: " + df.format(volumenCilindro));
                break;

            default:
                response.getWriter().println("Figura no válida");
        }
    }
}
