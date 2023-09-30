import Point.PointInArea;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>" +
                        "<body>" +
                            "<table>" +
                            "<thead>" +
                            "<tr>" +
                            "<th>X</th>" +
                            "<th>Y</th>" +
                            "<th>R</th>" +
                            "<th>Попадание</th>" +
                            "</thead>" +
                            "<tbody>");
        if(request.getSession().getAttribute("points")!=null){
            List<PointInArea> points = (List<PointInArea>) request.getSession().getAttribute("points");
            for(PointInArea pointInArea: points){
                out.println("<tr><td>"+Float.valueOf(pointInArea.getX()).toString()+
                        "</td><td>"+Float.valueOf(pointInArea.getY()).toString()+
                        "</td><td>"+Float.valueOf(pointInArea.getR()).toString()+
                        "</td><td>"+Boolean.valueOf(pointInArea.isInArea()).toString()+
                        "</td></tr>");
            }
        }
        out.println("</tbody>" +
                            "</table>");
        if(request.getSession().getAttribute("exceptionMessage")!=null){
            out.println("<p>"+request.getSession().getAttribute("exceptionMessage")+"</p>");
            request.getSession().removeAttribute("exceptionMessage");
        }
        out.println("<a href=\""+getServletContext().getContextPath()+"/web\">Ссылка на главную страницу</a>");
        out.println(
                "</body>" +
                "</html>");
        out.close();
    }
}
