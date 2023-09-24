package Point;

public class PointInArea extends Point{

    private boolean inArea;
    public boolean isInArea() {
        return inArea;
    }

    public PointInArea(Point point, boolean inArea){
        super(point.getX(),point.getY(),point.getR());
        this.inArea=inArea;
    }

}
