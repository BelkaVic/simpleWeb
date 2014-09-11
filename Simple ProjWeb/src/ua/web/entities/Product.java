package ua.web.entities;

/**
 * Класс для представления объктов из таблицы T_PRODUCT
 */
public class Product {
    private int id; //PRODUCT_ID
    private String name; //PRODUCT_NAME
    private int price; //PRODUCT_PRICE
    private int group_id; //GROUP_ID

    public Product(int product_id, String product_name, int group_id, int product_price) {}

    public Product(String product_name, int product_price) {
        this.name = product_name;
        this.price = product_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }
}
