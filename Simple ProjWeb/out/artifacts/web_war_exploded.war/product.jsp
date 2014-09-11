<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ua.web.entities.Product" %>
<html>
<head>
    <title></title>
</head>
<body>
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
            out.print("<TR cellspacing=\"5\"><TD cellspacing=\"5\"><b> Название </b></TD><TD cellspacing=\"5\"><b> Цена </b></TD></TR>");
            for (int i = 0; i < products.size(); i++) {
                // По каждому найденному элементу формируется строка таблицы
                out.print("<TR>");
                // Получение очередного элемента из коллекции
                Product p = (Product) products.get(i);
                // Заполнение строки таблицы
                out.print("<TD cellspacing=\"5\">" + p.getName() + "</TD>");
                out.print("<TD cellspacing=\"5\">" + p.getPrice() + "</TD>");
                out.print("</TR>");
            }
            out.print("</TABLE>");
        }
    }
%>
</body>
</html>
