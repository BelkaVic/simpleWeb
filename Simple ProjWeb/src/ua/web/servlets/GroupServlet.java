package ua.web.servlets;

import com.mysql.jdbc.Connection;
import ua.web.entities.Group;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Сервлет для работы с группами товаров
 */
public class GroupServlet extends HttpServlet {
    public GroupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con; //соединение с БД
        ResultSet rs; //результат sql-запроса

        try {
            response.setContentType("text/html;charset=UTF-8");
            // Получение из http-запроса значения параметра ID
            // String group_name = request.getParameter("group_name");

            // Коллекция для хранения найденных сотрудников
            ArrayList<Group> groups = new ArrayList<Group>();

            // Загрузка драйвера БД MySQL
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            // Получение соединения с БД
            con = (Connection) DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hr_test", "candidate", "candidate");
            // con.createStatement().executeQuery("set names 'cp1251' ");

            // Выполнение SQL-запроса
            rs = con.createStatement().executeQuery( "select t_group.group_id, t_group.group_name  from t_group " );
            // Перечисление результатов запроса
            while (rs.next()) {
                // По каждой записи выборки формируется объект класса Group.
                // Значения свойств заполяются из полей записи
                Group gr = new Group(
                        rs.getInt("GROUP_ID"),
                        rs.getString("GROUP_NAME") );
                // Добавление созданного объекта в коллекцию
                groups.add(gr);
            }
            // Закрываем выборку и соединение с БД
            rs.close();
            con.close();

/*            // Выводим информацию о найденных сотрудниках
            PrintWriter out = response.getWriter();
            out.println("Найденные группы<br>");
            for (Group g: groups) {
                out.println(g.getName() + " " + "<br>");
            }
 */

            // Помещение результатов в параметр запроса employeesFound
            request.setAttribute("groupsFound", groups);
            // Перенаправление http-запроса на страницу index_old.jsp
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);


        } catch (Exception ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }

    }
    }
