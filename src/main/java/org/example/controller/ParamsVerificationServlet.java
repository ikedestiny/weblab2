package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.Request;

import java.io.IOException;

@WebServlet(name = "ParamsVerificationServlet", value = "/params-verification-servlet")
public class ParamsVerificationServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Request parsedReq = (Request) request.getAttribute("parsedReq");
        if (isGoodParam(parsedReq.getX(), parsedReq.getY(), parsedReq.getR())) {
            getServletContext().getRequestDispatcher("/area-check-servlet").forward(request, response);
        } else {


            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "some params are not within boundary ");
        }


    }

    public boolean isGoodParam(float x, float y, float r) {
        return x >= -5 && x <= 3 && y >= -3 && y <= 3 && r >= 1 && r <= 4;
    }

}
