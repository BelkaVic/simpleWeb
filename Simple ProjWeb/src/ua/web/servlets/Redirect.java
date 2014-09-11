package ua.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Сервлет для подсчета посещений
 */
public class Redirect extends HttpServlet {
    private static int count = 0;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);

        count++;
        req.setAttribute("current_count", count);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
