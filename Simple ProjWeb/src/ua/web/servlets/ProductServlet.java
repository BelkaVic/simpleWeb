package ua.web.servlets;

import com.mysql.jdbc.Connection;
import ua.web.entities.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Сервлет для отображения
 */
public class ProductServlet extends HttpServlet implements Servlet {
   /* public ProductServlet() {
        super();
    }
*/

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con; //соединение с БД
        ResultSet rs; //результат sql-запроса



        try {
            response.setContentType("text/html;charset=UTF-8");
            // Получение из http-запроса значения параметра name
            String ggroup_name = request.getParameter("ggroup_name");

            // Коллекция для хранения найденных сотрудников
            ArrayList<Product> products = new ArrayList<Product>();

            // Загрузка драйвера БД MySQL
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            // Получение соединения с БД
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_test", "candidate", "candidate");

            // Выполнение SQL-запроса
            rs = con.createStatement().executeQuery(
      /*              "Select t_product.PRODUCT_NAME, t_product.PRODUCT_PRICE "
                            + "From t_product " + "Where t_product.product_name like '" + prod_name + "'");
                            */
                    "SELECT t_product.product_name, t_product.product_price "
                    + "FROM t_group " + "INNER JOIN t_product ON t_group.group_id = t_product.group_id && t_group.GROUP_NAME like '" + ggroup_name + "'");
            // Перечисление результатов запроса
            while (rs.next()) {
                // По каждой записи выборки формируется
                // объект класса Product.
                // Значения свойств заполяются из полей записи
                Product prod = new Product(
                        rs.getString("PRODUCT_NAME"),
                        rs.getInt("PRODUCT_PRICE") );
                // Добавление созданного объекта в коллекцию
                products.add(prod);
            }
            // Закрываем выборку и соединение с БД
            rs.close();
            con.close();

/*            // Выводим информацию о найденных сотрудниках
            PrintWriter out = response.getWriter();
            out.println("Найденные продукты<br>");
            for (Product proood: products) {
                out.println(proood.getName() + " " + proood.getPrice() + " " + "<br>");
            }*/

            // Помещение результатов в параметр запроса employeesFound
            request.setAttribute("productsFound", products);
            // Перенаправление http-запроса на страницу index_old.jsp
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);


        } catch (Exception ex) {
            ex.printStackTrace();
            throw new ServletException(ex);
        }

    }
}
