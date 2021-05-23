package controller;

import entity.Food;
import service.CategoryService;
import service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/foods/edit")
public class EditFoodServlet extends HttpServlet {
    private FoodService foodService = new FoodService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int foodId = Integer.parseInt(req.getParameter("foodId"));

        Food currentFood = foodService.getById(foodId);
        if(currentFood == null || currentFood.getStatus() == -1){
            req.setAttribute("errors", "Món ăn không tồn tại, vui lòng thử lại");
            req.getRequestDispatcher("/admin/foods/list.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("food", foodService.getById(foodId));
        req.setAttribute("categoryList", categoryService.getAll());
        req.getRequestDispatcher("/admin/foods/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8"); // lỗi Utf8 ngoài view
        int foodId = Integer.parseInt(req.getParameter("foodId"));

        Food currentFood = foodService.getById(foodId);
        if (currentFood == null){
            req.setAttribute("errors", "Món ăn không tồn tại, vui lòng thử lại");
            resp.sendRedirect("/admin/foods/list");
            return;
        }
        if (currentFood.getStatus() == -1) {
            req.setAttribute("errors", "Món ăn đã bị xoá");
            resp.sendRedirect("/admin/foods/list");
            return;
        }

        String name = req.getParameter("name");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String description = req.getParameter("description");
        String thumbnail = req.getParameter("thumbnail");
        double price = Double.parseDouble(req.getParameter("price"));
        int status = Integer.parseInt(req.getParameter("status"));

        if (!currentFood.isValid()) {
            Map<String, String> errors = currentFood.getErrors();
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/admin/foods/edit.jsp").forward(req, resp);
            return;
        }

        currentFood.setName(name);
        currentFood.setDescription(description);
        currentFood.setThumbnail(thumbnail);
        currentFood.setPrice(price);
        currentFood.setCategoryId(categoryId);
        currentFood.setStatus(status);
        foodService.edit(foodId, currentFood);
        resp.sendRedirect("/admin/foods/list");
    }
}
