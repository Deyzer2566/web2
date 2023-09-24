import Point.Point;

public class Validator {
    public static boolean checkPointsCoordinats(Point p) throws IllegalArgumentException{
        checkX(p);
        checkY(p);
        checkR(p);
        if(p.getX() >= 0 && p.getY() >= 0) {
            return p.getX() * p.getX() + p.getY() * p.getY() <= p.getR() * p.getR();
        } else if (p.getX() < 0 && p.getY() >= 0) {
            return p.getX()>= -p.getR()/2 && p.getY() <= p.getR();
        } else if (p.getX() <= 0 && p.getY() <= 0) {
            return -p.getX()/2-p.getR()/2 <= p.getY();
        }
        return false;
    }
    private static void checkX(Point point) throws IllegalArgumentException{
        boolean xIsValid = false;
        for(float i = -4.f;i<5.f;i+=1.f){
            if(point.getX() == i)
                xIsValid = true;
        }
        if(!xIsValid)
            throw new IllegalArgumentException("X не входит в заданный диапазон");
    }

    private static void checkY(Point point) throws IllegalArgumentException{
        if(point.getY() < -3.f || point.getY() > 5.f)
            throw new IllegalArgumentException("Y не входит в заданный диапазон");
    }

    private static void checkR(Point point) throws IllegalArgumentException{
        if(point.getR() < 1.f || point.getR() > 4.f)
            throw new IllegalArgumentException("R не входит в заданный диапазон");
    }
}
