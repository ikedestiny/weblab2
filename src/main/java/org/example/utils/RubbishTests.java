package org.example.utils;

import org.example.model.Point;
import org.example.model.Triangle;

public class RubbishTests {
    public static void main(String[] args) {
        System.out.println(RequestParser.parse("""
                {"x":"-2","y":"0","r":"3","sent":"13:36:3"}
                """));


        Point p = new Point(3,100);
        Point p2 = new Point(2,4);
        Point p3 = new Point(3,-63);
        System.out.println(new Triangle(p,p2,p3).area());

        System.out.println(p.radiusToCenter());
    }


}
