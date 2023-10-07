import Point.*;
import java.util.List;
import java.util.LinkedList;
import javax.servlet.http.HttpSession;

public class Model {
    public static List<PointInArea> getUsersPoints(HttpSession session){
        return (List<PointInArea>)session.getAttribute("points");
    }

    public static void checkPoint(HttpSession session, String xStr, String yStr, String rStr) throws IllegalArgumentException{
        float x;
        try{
            x = Float.parseFloat(xStr);
        } catch (NullPointerException e){
            throw new IllegalArgumentException("Значение X не введено!");
        }
        float y;
        try{
            y = Float.parseFloat(yStr);
        } catch (NullPointerException e){
            throw new IllegalArgumentException("Значение Y не введено!");
        }
        float r;
        try{
            r = Float.parseFloat(rStr);
        } catch (NullPointerException e){
            throw new IllegalArgumentException("Значение R не введено!");
        }
        Point p = new Point(x,y,r);
        boolean pointInArea = Validator.checkPointsCoordinats(p);
        List<PointInArea> points = getUsersPoints(session);
        if(points == null) {
            session.setAttribute("points", new LinkedList<PointInArea>());
            points = getUsersPoints(session);
        }
        points.add(new PointInArea(p, pointInArea));
        List<PointInArea> newPoints = new LinkedList<>();
        points.forEach(z->
            newPoints.add(new PointInArea(z,Validator.checkPointsCoordinats(new Point(z.getX(), z.getY(), r))))
        );
        session.setAttribute("points", newPoints);
        session.setAttribute("curR", Float.valueOf(r));
    }
}
