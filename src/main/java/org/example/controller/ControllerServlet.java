package org.example.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.stream.Collectors;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.utils.RequestParser;

@WebServlet(name = "ControllerServlet", value = "/controller-servlet")
public class ControllerServlet  extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
    	ServletContext sc = getServletContext();
    	sc.setAttribute("name","ike destiny");
        String body = "";
        try {
            // body  = RequestParser.getRequestBody(request);
             //TODO here the request will be validated before sending to area check if okay

        } catch (Exception e) {
            body = "error happened";
            System.out.println(e);
             //TODO send error response
        }


        getServletContext().getRequestDispatcher("/area-check-servlet").forward(request, response);
    }	
    
    

}



