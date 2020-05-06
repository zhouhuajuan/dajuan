package com.zhj.event.web;

import com.zhj.event.bean.User;
import com.zhj.event.service.UserService;
import com.zhj.event.service.impl.UserServiceImpl;
import sun.plugin.dom.core.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;

@WebServlet(name = "UpdatePassServlet",urlPatterns = "/UpdatePassServlet")
public class UpdatePassServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Element session = null;
        assert false;
        Object obj=session.getAttribute("userNow");
        User user = (User)obj;
        String username = user.getUsername();
        String password = user.getPassword();
        String newPass = request.getParameter("newPass");
        String role = user.getRole();
        if (userService.existUser(username,password,role)){
            userService.updatePassword(new User(null,username,newPass,role));
            request.getRequestDispatcher("login_success.jsp").forward(request,response);
        }else {
            JOptionPane.showMessageDialog(null, "原密码错误！");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
