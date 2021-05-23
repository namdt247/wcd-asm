package entity;

import hanotation.Column;
import hanotation.Entity;
import hanotation.Id;

@Entity(tableName = "categories")
public class Category {
    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = "int")
    private int id;
    @Column(columnName = "name", columnType = "varchar(255)")
    private String name;
    @Column(columnName = "status", columnType = "int")
    private int status; // 1.active, 2.deactive, -1.deleted

    public Category() {
    }

    public Category(String name, int status) {
        this.name = name;
        this.status = status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
