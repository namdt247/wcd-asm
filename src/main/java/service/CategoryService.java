package service;

import entity.Category;
import entity.Food;
import repository.GenericRepository;

import java.util.List;

public class CategoryService {
    private GenericRepository<Category> categoryRepository;

    public CategoryService() {
        categoryRepository = new GenericRepository<>(Category.class);
    }

    public List<Category> getAll() {
        return categoryRepository.getAll();
    }

    public Category getById(int id) {
        return categoryRepository.findById(id);
    }
}
