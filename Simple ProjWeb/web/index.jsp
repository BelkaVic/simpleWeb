<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ua.web.entities.Group" %>
<%@page import="ua.web.entities.Product" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="sortScript.js"></script>
    <title>Список товаров</title>

    <style type="text/css">
        body {
            font: 10pt Arial, Helvetica, sans-serif; /* Шрифт на веб-странице */
            background: #e1dfb9; /* Цвет фона */
        }
        h2 {
            font-size: 1.1em; /* Размер шрифта */
            color: #800040; /* Цвет текста */
            margin-top: 0; /* Отступ сверху */
        }
        #container {
            width: 900px; /* Ширина слоя */
            margin: 0 20%; /* Выравнивание по центру */
            background: #f0f0f0; /* Цвет фона левой колонки */
        }
        #header {
            font-size: 2.2em; /* Размер текста */
            text-align: center; /* Выравнивание по центру */
            padding: 5px; /* Отступы вокруг текста */
            background: #8fa09b; /* Цвет фона шапки */
            color: #ffe; /* Цвет текста */
        }
        #sidebar {
            margin-top: 10px;
            width: 110px; /* Ширина слоя */
            padding: 0 25px; /* Отступы вокруг текста */
            float: left; /* Обтекание по правому краю */
        }
        #content {
            margin-left: 130px; /* Отступ слева */
            padding: 10px; /* Поля вокруг текста */
            background: #fff; /* Цвет фона правой колонки */
        }
        #footer {
            background: #8fa09b; /* Цвет фона подвала */
            color: #fff; /* Цвет текста */
            padding: 2px 25px; /* Отступы вокруг текста */
            clear: left; /* Отменяем действие float */
        }
        #tdProduct{
            cellspacing: 10; /* Отступы между ячейками */
        }
    </style>

</head>
<body>
<div id="container">
    <div id="header">Список товаров</div>
    <div id="sidebar">
        <form action="/group" >
            <input type=submit value="Отобразить">
        </form>

        <%
            // Получение значения параметров
            ArrayList groups = (ArrayList) request.getAttribute("groupsFound");
            // Если параметр задан, начинаем обработку
            if (groups != null) {
                // Если не найдено ни одной группы - вывод сообщения
                if (groups.size() == 0)
                    out.print("Группы не найдены");
                else {
                    for (int i = 0; i < groups.size(); i++) {
                       // Получение очередной группы из коллекции
                        Group g = (Group) groups.get(i);

                       // ${tmpGroupNameValue} = g.getName();

                        // Заполнение строки таблицы
                         out.print("<p><a href=\"/product?ggroup_name=" + g.getName() + "\" >" + g.getName() + "</a> <p>");
                    }
                }
            }
        %>
    </div>

    <div id="content">
        <form action="/product" method="post"></form>
        <%
            // Получение значения параметров
            ArrayList products = (ArrayList) request.getAttribute("productsFound");
            // Если параметр задан, начинаем обработку
            if (products != null) {
                // Если не найдено ни одной группы - вывод сообщения
                if (products.size() == 0)
                    out.print("Элементы группы не найдены");
                else {
                    out.print("<TABLE border=\"0\" cellspacing=\"5\" cellpadding=\"0\">");
                    // Заголовок таблицы
                    out.print("<TR cellspacing=\"5\"><TD id=\"tdProduct\"><b> Номер </b></TD><TD id=\"tdProduct\" onclick=\"sort(this)\"><b> Название </b></TD><TD id=\"tdProduct\" onclick=\"sort(this)\"><b> Цена </b></TD></TR>");
                    for (int i = 0; i < products.size(); i++) {
                        // По каждому найденному элементу формируется строка таблицы
                        out.print("<TR>");
                        // Получение очередного элемента из коллекции
                        Product p = (Product) products.get(i);
                        // Заполнение строки таблицы
                        out.print("<TD id=\"tdProduct\">" + (i+1) + "</TD>");
                        out.print("<TD id=\"tdProduct\">" + p.getName() + "</TD>");
                        out.print("<TD id=\"tdProduct\">" + p.getPrice() + "</TD>");
                        out.print("</TR>");
                    }
                    out.print("</TABLE>");
                }
            }
        %>
    </div>

    <div id="footer">&copy; Ткаченко Виктория  <br>  tkachenko.vic.a@gmail.com</div>
</div>
</body>
</html>
