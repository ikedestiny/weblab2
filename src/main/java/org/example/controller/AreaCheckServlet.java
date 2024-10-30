package org.example.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.beans.Results;
import org.example.model.Request;
import org.example.model.Result;
import org.example.utils.Checker;
import org.example.utils.RequestParser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AreaCheckServlet", value = "/area-check-servlet")
public class AreaCheckServlet  extends HttpServlet{
   static Gson gson = new Gson();
   static Checker checker = new Checker();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        Request parsedRequest = (Request) req.getAttribute("parsedReq");
        parsedRequest.setReceived(System.nanoTime());
        Result result = checker.check(parsedRequest);
        ((Results)req.getSession().getAttribute("results")).addResult(result);
        getServletContext().setAttribute("current",result);
        resp.sendRedirect(req.getContextPath()+"/added.jsp");

    }

}
