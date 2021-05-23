package service;

import entity.Food;
import repository.GenericRepository;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class FoodService {
    private GenericRepository<Food> foodRepository;

    Date date = new Date();
    Timestamp sqlTime = new Timestamp(date.getTime());

    public FoodService() {
        foodRepository = new GenericRepository<>(Food.class);
    }

    public boolean create(Food obj) {
        obj.setSaleDate(sqlTime);
        obj.setUpdatedAt(sqlTime);
        obj.setStatus(1);
        return foodRepository.save(obj);
    }

    public List<Food> getList(int a, int b) {
        return foodRepository.findAll(a,b);
    }

    public Food getById(int id) {
        return foodRepository.findById(id);
    }

    public boolean edit(int id, Food obj) {
        obj.setUpdatedAt(sqlTime);
        return foodRepository.update(id, obj);
    }

    public boolean delete(int id, Food obj) {
        obj.setUpdatedAt(sqlTime);
        obj.setStatus(-1);
        System.out.println(obj.getSaleDate());
        return foodRepository.update(id, obj);
    }
}
