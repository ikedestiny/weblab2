package org.example.utils;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.http.HttpServletRequest;
import org.example.exceptions.ParseError;
import org.example.model.Request;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;
import java.time.LocalTime;

public class RequestParser {
    static Gson gson = new Gson();
    public static Request parse(String requestJson) {
        try{
        Request request = gson.fromJson(requestJson, Request.class);
        request.setReceived(System.nanoTime());
        return request;} catch (Exception e) {
            throw new ParseError();
        }
    }

    public static String getRequestBody(HttpServletRequest request) throws IOException {
        StringBuilder requestBody = new StringBuilder();
        String line;

        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }
        }

        // Now you can use requestBody.toString() for processing the data
        System.out.println("Received POST data: " + requestBody.toString());

        return requestBody.toString();
    }

}
