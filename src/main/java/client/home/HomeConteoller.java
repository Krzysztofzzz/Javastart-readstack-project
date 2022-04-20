package client.home;

import domain.api.CategoryName;
import domain.api.CategoryService;
import domain.api.DiscoveryBasicInfo;
import domain.api.DiscoveryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("")
public class HomeConteoller extends HttpServlet {
    private final DiscoveryService discoveryService = new DiscoveryService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<DiscoveryBasicInfo> discoveries = discoveryService.findAll();
        request.setAttribute("discoveries",discoveries);
        List<CategoryName> categories = categoryService.findAllCategoryNames();
        request.setAttribute("categories",categories);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request,response);
    }
}

