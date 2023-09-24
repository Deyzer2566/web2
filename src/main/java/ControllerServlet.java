
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ControllerServlet", urlPatterns = {"/web"})
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");
        if(x != null || y != null || r != null){
            getServletContext().getNamedDispatcher("AreaCheckServlet").forward(request, response);
        }
        else getServletContext().getRequestDispatcher("/page.jsp").forward(request, response);
    }
}
