package entity;

import hanotation.Column;
import hanotation.Entity;
import hanotation.Id;
import service.CategoryService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Entity(tableName = "foods")
public class Food {
    @Id(autoIncrement = true)
    @Column(columnName = "id", columnType = "int")
    private int id;
    @Column(columnName = "name", columnType = "varchar(255)")
    private String name;
    @Column(columnName = "categoryId", columnType = "int")
    private int categoryId;
    @Column(columnName = "description", columnType = "varchar(1023)")
    private String description;
    @Column(columnName = "thumbnail", columnType = "varchar(1023)")
    private String thumbnail;
    @Column(columnName = "price", columnType = "double")
    private double price;
    @Column(columnName = "saleDate", columnType = "date")
    private Date saleDate;
    @Column(columnName = "updatedAt", columnType = "date")
    private Date updatedAt;
    @Column(columnName = "status", columnType = "int")
    private int status; // 1.đang bán, 2.dừng bán, -1.đã xóa

    public Food() {
    }

    public Food(int id, String name, int categoryId, String description, String thumbnail, double price, Date saleDate, Date updatedAt, int status) {
        this.id = id;
        this.name = name;
        this.categoryId = categoryId;
        this.description = description;
        this.thumbnail = thumbnail;
        this.price = price;
        this.saleDate = saleDate;
        this.updatedAt = updatedAt;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private Map<String, String> errors = new HashMap<String, String>();

    public Map<String, String> getErrors() {
        return errors;
    }

    public void setErrors(Map<String, String> errors) {
        this.errors = errors;
    }

    public boolean isValid() {
        boolean isOk = true;

        if (this.name == null || this.name.trim().equals("")) {
            isOk = false;
            errors.put("name", "Tên món ăn không được để trống");
        } else {
            if (this.name.length() < 8) {
                isOk = false;
                errors.put("name", "Tên món ăn tối thiểu 8 ký tự");
            }
        }

        if (this.price <= 0) {
            isOk = false;
            errors.put("price", "Giá món ăn phải lớn hơn 0");
        }

        if (this.categoryId == 0) {
            isOk = false;
            errors.put("cateId", "Chưa chọn danh mục món ăn");
        }

        return isOk;
    }

    public Category getCategoryName(int id) {
        CategoryService categoryService = new CategoryService();
        return categoryService.getById(id);
    }
}
