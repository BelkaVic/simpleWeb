package ua.web.entities;

/**
 * Класс для представления объктов из таблицы T_GROUP
 */
public class Group {
    private int id; // GROUP_ID
    private String name; // GROUP_NAME


    public Group(int group_id, String group_name) {
        this.id = group_id;
        this.name = group_name;
    }

    public Group(String group_name) {
        this.name = group_name;
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
}
