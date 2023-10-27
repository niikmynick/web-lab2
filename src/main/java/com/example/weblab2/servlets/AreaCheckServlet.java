package com.example.weblab2.servlets;

import com.example.weblab2.beans.Hit;
import com.example.weblab2.beans.UserCollection;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.logging.Logger;

@WebServlet(name = "areaCheckServlet", value = "/areaCheck-servlet")
public class AreaCheckServlet extends jakarta.servlet.http.HttpServlet {
    private static final Logger logger = Logger.getLogger(AreaCheckServlet.class.getName());
    private static final double MIN_X = -4, MAX_X = 4;
    private static final double MIN_Y = -3, MAX_Y = 3;
    private static final double MIN_R = 1, MAX_R = 3;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("received new data");
        ServletContext context = getServletContext();

        double x, y;
        double[] rValues;

        try {
            x = Double.parseDouble(request.getParameter("x-value"));
            y = Double.parseDouble(request.getParameter("y-value"));

            rValues = Arrays.stream(request.getParameterValues("r-value"))
                    .mapToDouble(Double::parseDouble)
                    .toArray();

        } catch (NumberFormatException e) {
            logger.info("Invalid data format");
            // forward to JSP with form
            context.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }


        for (Double r : rValues) {

            if (notValid(x, y, r)) {
                logger.info("Invalid data format");
                // forward to JSP with form
                context.getRequestDispatcher("/index.jsp").forward(request, response);
            }

            UserCollection userCollection = (UserCollection) context.getAttribute("userCollection");

            Hit hit = new Hit(x, y, r);
            hit.setRequestTime( LocalDateTime.now().format( DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss") ) );

            if (x >= 0) {
                if (y >= 0) {
                    hit.setStatus( x + y <= r );
                } else {
                    hit.setStatus( (x <= (r / 2)) && (y >= -r) );
                }
            } else {
                if (y >= 0) {
                    hit.setStatus( Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow((r/2), 2) );
                }
            }

            long startTime = Long.parseLong( context.getAttribute("startTime").toString() );
            long endTime = System.nanoTime();

            hit.setScriptTime( String.valueOf((endTime - startTime) / 1000000) );

            userCollection.getCollection().add(0, hit);
            logger.info(hit + "added to history");

            context.setAttribute("userCollection", userCollection);
        }

        logger.info("userCollection: " + context.getAttribute("userCollection"));
        context.setAttribute("batchSize", rValues.length);

        context.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private boolean notValid(double x, double y, double r) {
        return !((x >= MIN_X && x <= MAX_X) && (y >= MIN_Y && y <= MAX_Y) && (r >= MIN_R && r <= MAX_R));
    }
}
