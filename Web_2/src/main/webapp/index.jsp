<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" xmlns="">

<head>
    <link rel="stylesheet" href="page.css">
    <meta charset="UTF-8">
    <title>Web2</title>
    <link rel="icon" type="image/png" href="images/duck.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
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

<table id="mainTable">
    <thead>
    <div id="popup" class="popup"></div>
    <tr>
        <th>Валидация введённых значений:</th>
    </tr>

    </thead>
    <tbody>
    <tr>
        <td colspan="4">
            <hr>
        </td>
    </tr>

    <tr>

        <td>Выберите X:</td>
        <td>
            <select id="nums" name="nums">
                <option value="-5">-5</option>
                <option value="-4">-4</option>
                <option value="-3">-3</option>
                <option value="-2">-2</option>
                <option value="-1">-1</option>
                <option value="0" selected>0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <span id="x-value">Текущий X: 0</span>
        </td>
    </tr>

    <tr>
        <td>Введите Y:</td>
        <td><input required name="Y-input" type="text" placeholder="(от -5 до 5)" maxlength="3"></td>
    </tr>

    <tr>
        <td>Выберите R:</td>
        <td><input required name="R-input" type="text" placeholder="(от 2 до 5)" maxlength="3"></td>


        <td rowspan="6">
            <svg id="plot" xmlns="http://www.w3.org/2000/svg">
                <line x1="0" y1="200" x2="400" y2="200" stroke="#000720"></line>
                <line x1="200" y1="0" x2="200" y2="400" stroke="#000720"></line>
                <line x1="350" y1="198" x2="350" y2="202" stroke="#000720"></line>
                <text x="355" y="195">R</text>
                <line x1="275" y1="198" x2="275" y2="202" stroke="#000720"></line>
                <text x="280" y="195">R/2</text>
                <line x1="125" y1="198" x2="125" y2="202" stroke="#000720"></line>
                <text x="123" y="195">-R/2</text>
                <line x1="50" y1="198" x2="50" y2="202" stroke="#000720"></line>
                <text x="55" y="195">-R</text>
                <line x1="198" y1="50" x2="202" y2="50" stroke="#000720"></line>
                <text x="204" y="55">R</text>
                <line x1="198" y1="125" x2="202" y2="125" stroke="#000720"></line>
                <text x="204" y="130">R/2</text>
                <line x1="198" y1="275" x2="202" y2="275" stroke="#000720"></line>
                <text x="204" y="280">-R/2</text>
                <line x1="198" y1="350" x2="202" y2="350" stroke="#000720"></line>
                <text x="204" y="355">-R</text>

                <polygon points="400,200 395,205 395, 195" fill="#000720" stroke="#101F27"></polygon>
                <polygon points="200,0 195,5 205,5" fill="#000720" stroke="#101F27"></polygon>


                <polygon points="200,200 350,200 200,350" fill-opacity="0.6" stroke="black" fill="red"></polygon>

                <rect x="125" y="200" width="75" height="150" fill-opacity="0.6" stroke="black" fill="red"></rect>


                <path d="M 200 200 L 200 50 C 275 50 350 125 350 200 Z" fill-opacity="0.6" stroke="black"
                      fill="red"></path>

                <circle id="pointer" r="8" cx="200" cy="200" fill-opacity="0.8" fill="red" visibility="hidden"></circle>
            </svg>
        </td>
    </tr>


    <tr>
        <td colspan="3">
            <button id="checkButton">Проверить</button>
            <audio id="audioPlayer" src="images/krya.mp3" preload="auto"></audio>
            <audio id="audioPlayer2" src="images/fail-wha-wha-version.mp3" preload="auto"></audio>
        </td>
    </tr>
    <tr>
        <td colspan="15">
            <hr>
        </td>
    </tr>
    </tbody>

    <tfoot>
    <td>
        <div id="goBack">
            <a href="result.jsp">Табличка с результатами на отдельной странице</a>
        </div>
    </td>
    <tr>
        <td colspan="10">
            <h4>
                <span class="outputStub notification">Нет результатов</span>

                <table class="history" id="outputContainer">
                    <tr>
                        <th>Попытка:</th>
                        <th>X:</th>
                        <th>Y:</th>
                        <th>R:</th>
                        <th>Попадание:</th>
                        <th>Время:</th>
                        <th>Точное время:</th>
                    </tr>
                    <tr id="Number"></tr>
                    <tr id="XHistory"></tr>
                    <tr id="YHistory"></tr>
                    <tr id="RHistory"></tr>
                    <tr id="hit"></tr>
                    <tr id="time"></tr>
                    <tr id="run"></tr>
                </table>
            </h4>
        </td>
    </tr>

    </tfoot>
</table>
<script src="script.js"></script>
</body>
<footer>
    <figure>
        Университет ИТМО, факультет ПИиКТ, бывшая кафедра ВТ
        <figcaption>2024 год</figcaption>
    </figure>
</footer>
</html>
