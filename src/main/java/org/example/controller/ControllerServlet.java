package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.beans.Results;
import org.example.exceptions.ParseError;
import org.example.model.Request;
import org.example.utils.RequestParser;

import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/controller-servlet")
public class ControllerServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Request parsedReq = RequestParser.parse(RequestParser.getRequestBody(request));
            request.setAttribute("parsedReq", parsedReq);
            getServletContext().getRequestDispatcher("/params-verification-servlet").forward(request, response);
            //if no error params are complete
            //req sent to verification servlet
        } catch (ParseError e) {
            //if we couldnt parse then the params were messed up
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.toString());
        }


    }

    /**
     * for handling deletes requests coz jsp cant handle delete mapping
     *
     * @param request  an {@link HttpServletRequest} object that contains the request the client has made of the servlet
     * @param response an {@link HttpServletResponse} object that contains the response the servlet sends to the client
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ((Results) request.getSession().getAttribute("results")).clearAll();
        response.sendRedirect(request.getContextPath() + "/clear.jsp");

    }


}



