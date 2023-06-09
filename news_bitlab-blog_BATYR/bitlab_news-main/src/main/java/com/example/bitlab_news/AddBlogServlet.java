package com.example.bitlab_news;

import classes.Blog;
import classes.Categories;
import classes.DBManager;
import classes.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddBlogServlet", value = "/addblog")
public class AddBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("cur_user");
        if(currentUser!=null) {
            request.getRequestDispatcher("/addBlog.jsp").forward(request, response);
        }else{
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String redirect = "/login";
        User currentUser = (User) request.getSession().getAttribute("cur_user");
        if(currentUser != null){
            redirect = "/addblog?error";
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String url = request.getParameter("url");
            Long c_id = Long.parseLong(request.getParameter("categories"));
            Blog blog = new Blog();
            Categories c = new Categories();
            c.setId(c_id);
            blog.setTitle(title);
            blog.setContent(content);
            blog.setUser(currentUser);
            blog.setUrl(url);
            blog.setCategories(c);
            if(DBManager.addBlog(blog)){
                redirect = "/addblog?success";
            }
        }
        response.sendRedirect(redirect);
    }
}
