package com.example.weblab2.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import com.example.weblab2.beans.UserCollection;
import java.util.logging.Logger;

@WebServlet("/controller")
@MultipartConfig
public class ControllerServlet extends jakarta.servlet.http.HttpServlet {

    private static final Logger logger = Logger.getLogger(ControllerServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("received POST request");
        ServletContext context = getServletContext();

        long startTime = System.nanoTime();

        // get values
        String x = request.getParameter("x-value");
        String y = request.getParameter("y-value");
        String[] r = request.getParameterValues("r-value");

        // check values for nulls
        if (x == null || y == null || r == null) {
            logger.info("Some data missing");
            // forward to JSP with form
            context.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        UserCollection userCollection = (UserCollection) context.getAttribute("userCollection");

        if (userCollection == null) {
            userCollection = new UserCollection();
        }

        context.setAttribute("userCollection", userCollection);
        context.setAttribute("startTime", startTime);

        context.getRequestDispatcher("/areaCheck-servlet").forward(request, response);
    }
}