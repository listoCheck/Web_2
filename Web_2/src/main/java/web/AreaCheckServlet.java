package web;

import com.google.gson.Gson;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkArea")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        addRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        addRequest(request, response);
    }

    private void addRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            float x = Float.parseFloat(request.getParameter("x"));
            float y = Float.parseFloat(request.getParameter("y"));
            float r = Float.parseFloat(request.getParameter("r"));
            boolean hit = checkArea(x, y, r);
            //System.out.println(x + "," + y + "," + r + "," + hit);
            //String action = request.getParameter("action");
            Gson gson = new Gson();
            Map<String, Object> json = new HashMap<>();
            json.put("x", x);
            json.put("y", y);
            json.put("r", r);
            json.put("hit", hit);

            HttpSession session = request.getSession();
            List<Point> points = (List<Point>) session.getAttribute("points");
            if (points == null) {
                points = new ArrayList<>();
                session.setAttribute("points", points);
            }
            Point point = new Point(x, y, r);
            points.add(point);

            String jsonResponseString = gson.toJson(json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponseString);

        } catch (Exception e) {
            makeMessage(response, e.toString());
        }
    }

    private boolean checkArea(float x, float y, float r) {
        if (x >= 0 && y >= 0 && x * x + y * y <= r * r) {
            return true;
        }
        if (x >= 0 && y <= 0 && y >= x - r) {
            return true;
        }
        if (x <= 0 && y <= 0 && x >= -r && y >= -r / 2) {
            return true;
        }
        return false;
    }

    public void makeMessage(HttpServletResponse response, String message) throws IOException {
        Gson json = new Gson();
        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("error", message);
        jsonResponse.put("status", "UNPROCESSABLE_ENTITY");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Убедитесь, что статус установлен ДО записи ответа
        response.setStatus(422);

        // Возвращаем JSON-ответ
        response.getWriter().write(json.toJson(jsonResponse));
        response.getWriter().flush();  // Очищаем буфер вывода
    }

}
