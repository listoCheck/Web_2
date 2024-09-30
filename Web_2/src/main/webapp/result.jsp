<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="web.Point" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="page.css">
    <meta charset="UTF-8">
    <title>Результаты проверки</title>
    <link rel="icon" type="image/png" href="images/duck.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>

        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<header>
    <div class="header-content">
        <img id="pic" src="images/logo.png" alt="pic">
        <div class="header-text">
            <h1>Лабораторная работа по вебу №2</h1>
            <h2>ААА</h2>
            <h2>Группа P3206, Вариант №115221</h2>
        </div>
    </div>

</header>
<body>
<h1>Результаты проверки точек</h1>
<table id="mainTable">
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Точка входит в ОДЗ</th>
    </tr>
    <%
        try {
            List<Point> points = (List<Point>) request.getSession().getAttribute("points");
            if (points != null && !points.isEmpty()) {
                for (Point point : points) {
    %>
    <tr>
        <td><%= point.getX() %></td>
        <td><%= point.getY() %></td>
        <td><%= point.getR() %></td>
        <td><%= point.checkArea() ? "<span class=\"success\">Да</span>" : "<span class=\"fail\">Нет</span>" %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="4">Нет результатов для отображения.</td>
    </tr>
    <%
        }
    } catch (Exception e) {
    %>
    <tr>
        <td colspan="4">Ошибка: <%= e.getMessage() %></td>
    </tr>
    <%
            e.printStackTrace();
        }
    %>
</table>
<div id="goBack">
    <a href="index.jsp">Вернуться к форме</a>
</div>
</body>
</html>
