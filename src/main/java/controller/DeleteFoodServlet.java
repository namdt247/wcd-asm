package controller;

import entity.Food;
import service.FoodService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/foods/delete")

public class DeleteFoodServlet extends HttpServlet {
    private FoodService foodService = new FoodService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int foodId = Integer.parseInt(req.getParameter("id"));
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
        System.out.println(currentFood.getSaleDate());
        foodService.delete(foodId, currentFood);
        resp.sendRedirect("/admin/foods/list");
    }
}
