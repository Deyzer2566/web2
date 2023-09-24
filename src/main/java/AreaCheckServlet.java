import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");
        try{
            Model.checkPoint(request.getSession(), x, y, r);
        } catch (IllegalArgumentException e) {
            request.getSession().setAttribute("exceptionMessage", e.getMessage());
        }
        getServletContext().getRequestDispatcher("/page.jsp").forward(request, response);
    }
}
