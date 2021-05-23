package controller;

import entity.Category;
import entity.Food;
import jdk.nashorn.internal.runtime.OptimisticReturnFilters;
import service.CategoryService;
import service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/foods/create")
public class CreateFoodServlet extends HttpServlet {
    private FoodService foodService = new FoodService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categoryList = categoryService.getAll();
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("/admin/foods/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // fix loi UTF-8
        Food food = new Food();

        int cateId = 0;
        double parsePrice = 0;

        String name = req.getParameter("name");
        String categoryId = req.getParameter("categoryId");
        if (categoryId != null && !categoryId.trim().equals("")) {
            cateId = Integer.parseInt(categoryId);
        }
        String description = req.getParameter("description");
        String thumbnail = req.getParameter("thumbnail");
        String price = req.getParameter("price");
        if (price != null && !price.trim().equals("")) {
            parsePrice = Double.parseDouble(price);
        }

        food.setName(name);
        food.setCategoryId(cateId);
        food.setDescription(description);
        food.setThumbnail(thumbnail);
        food.setPrice(parsePrice);

        if (!food.isValid()) {
            Map<String, String> errors = food.getErrors();
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/admin/foods/form.jsp").forward(req, resp);
            return;
        }

        foodService.create(food);
        resp.sendRedirect("/admin/foods/list");
    }
}
