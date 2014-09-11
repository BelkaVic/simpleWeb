<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <table>
        <tr>
            <td> Посещений: </td>
            <td><%=( request.getAttribute("current_count") == null ? "error" : request.getAttribute("current_count") )%></td>
        </tr>
    </table>
</div>
</body>
</html>
