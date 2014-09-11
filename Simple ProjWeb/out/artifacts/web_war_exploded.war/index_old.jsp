<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ua.web.entities.Group" %>
<%@page import="ua.web.entities.Product" %>

<html>
<head>
    <title>Список продуктов</title>
</head>
<body>


<div style="width:100%;">
    <div style="display:block;width:100%;">
        <h1>СПИСОК ТОВАРОВ</h1> <br>
        Исполнитель Ткаченко Виктория <br>
    </div>

    <div style="width:35%;float:left;">

        <form action="/group">
            <%-- <input type="text" name="lastname">--%>
            <input type=submit value="Отобразить список групп">
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
                    out.print("<TABLE border=\"0\" cellspacing=\"5\" cellpadding=\"0\">");
                    // Заголовок таблицы
                    out.print("<TR cellspacing=\"5\"><TD cellspacing=\"5\"><b> Имя </b></TD></TR>");
                    for (int i = 0; i < groups.size(); i++) {
                        // По каждому найденной группе формируется строка таблицы
                        out.print("<TR>");
                        // Получение очередной группы из коллекции
                        Group g = (Group) groups.get(i);
                        // Заполнение строки таблицы
                        out.print("<TD cellspacing=\"5\"> <a href=\"/product?" + g.getName() + "/\">" + g.getName() + "</a> </TD>");
                        out.print("</TR>");
                    }
                    out.print("</TABLE>");

                }
            }
            <jsp:forward page="/index.jsp"></jsp:forward>
        %>

    </div>

    <div style="width:65%;float:left;">
        <form action="/product">
            <input type="text" name="lastname">

        </form>
        <iframe src="product.jsp" width="600" height="420">
           <%-- <jsp:forward page="/product.jsp"></jsp:forward>--%>
        </iframe>


    </div>

</div>



</body>
</html>