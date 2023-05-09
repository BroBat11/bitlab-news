package com.example.bitlab_news;

import classes.Blog;
import classes.DBManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.awt.image.DataBuffer;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Blog> profBlog = DBManager.getAllBlogs();
        request.setAttribute("prof", profBlog);
        request.getRequestDispatcher("profile.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
