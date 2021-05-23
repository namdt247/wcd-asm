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
        int status = Integer.parseInt(req.getParameter("status"));

        currentFood.setName(name);
        currentFood.setDescription(description);
        currentFood.setThumbnail(thumbnail);
        currentFood.setPrice(parsePrice);
        currentFood.setCategoryId(cateId);
        currentFood.setStatus(status);

        if (!currentFood.isValid()) {
            Map<String, String> errors = currentFood.getErrors();
            req.setAttribute("food", foodService.getById(foodId));
            req.setAttribute("errors", errors);
            resp.sendRedirect("/admin/foods/edit?foodId=" + currentFood.getId());
//            req.getRequestDispatcher("/admin/foods/edit.jsp").forward(req, resp);
            return;
        }

        foodService.edit(foodId, currentFood);
        resp.sendRedirect("/admin/foods/list");
    }
}
