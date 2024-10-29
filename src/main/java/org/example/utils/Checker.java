package org.example.utils;

import org.example.model.Point;
import org.example.model.Request;
import org.example.model.Result;
import org.example.model.Triangle;

public class Checker {

    public Result check(Request request) {
        Result result = new Result(false, request.getX(), request.getY(), request.getR(), request.getSent(), Long.toString(System.nanoTime() - request.getReceived()));
        if (request.getX() < 0 && request.getY() > 0) {
            result.setInArea(false);
        } else if (inArc(request) || inRect(request) || inTriangle(request)) {
            result.setInArea(true);
        } else {
            result.setInArea(false);
        }
        return result;
    }


    public boolean inArc(Request request) {
        if (!(request.getX() >= 0 && request.getY() >= 0)) {
            return false;
        }
        return new Point(request.getX(), request.getY()).radiusToCenter() <= request.getR();
    }

    public boolean inTriangle(Request request) {
        if (!(request.getX() >= 0 && request.getY() <= 0)) {
            return false;
        }

        Point checkPoint = new Point(request.getX(), request.getY());
        Point center = new Point(0, 0);
        Point Ox = new Point(request.getR() / 2, 0);
        Point Oy = new Point(0, -request.getR());

        Triangle main = new Triangle(center, Ox, Oy);
        Triangle t1 = new Triangle(center, Ox, checkPoint);
        Triangle t2 = new Triangle(center, Oy, checkPoint);
        Triangle t3 = new Triangle(Oy, Oy, checkPoint);

        return main.area() == t1.area() + t2.area() + t3.area();
    }

    public boolean inRect(Request request) {
        if (!(request.getX() <= 0 && request.getY() <= 0)) {
            return false;
        }

        return request.getX() >= -request.getR() / 2 && request.getY() >= -request.getR();

    }
}
