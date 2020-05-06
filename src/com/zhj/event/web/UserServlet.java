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
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {

    /*private UserService userService = new UserServiceImpl();

    *//**
     * 设置输错密码的次数
     *//*
    int failCount = 0;

    *//**
     * 处理登陆的功能
     * @param request 请求
     * @param response 回应
     * @throws ServletException 抛出异常
     * @throws IOException 抛出异常
     *//*
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        *//*Cookie cookie = new Cookie("username", username);
        Cookie cookie2 = new Cookie("password", password);
        response.addCookie(cookie);
        response.addCookie(cookie2);*//*
        User loginUser = userService.login(new User(null, username, null, role));
        if (loginUser == null) {
            request.setAttribute("msg", "用户名错误！");
            request.setAttribute("username", username);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String password1 = loginUser.getPassword();
            if (Objects.equals(password, password1)) {
                request.getRequestDispatcher("login_success.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "密码错误！");
                request.setAttribute("username", username);
                failCount++;
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            //输错密码三次则须进行图形认证
            if (failCount >= 3) {
                request.getRequestDispatcher("check_code.jsp").forward(request, response);
            }

            loginUser.setUsername(username);
            loginUser.setPassword(password);
            loginUser.setRole(role);
            Element session = null;
            assert false;
            session.setAttribute("userNow", String.valueOf(loginUser));
    }

    *//**
     * 处理注册的功能
     * @param request 请求
     * @param response 回应
     * @throws ServletException 抛出异常
     * @throws IOException 抛出异常
     *//*
    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String code = request.getParameter("code");
            if ("abcd".equalsIgnoreCase(code)){
                if (userService.existUsername(username,role)){
                    request.setAttribute("msg","用户名已存在！");
                    request.setAttribute("username",username);
                    request.getRequestDispatcher("register.jsp").forward(request,response);
                }else {
                    if ((role.equals("player"))) {
                        request.getRequestDispatcher("player_register.jsp").forward(request,response);
                    }
                    userService.registerUser(new User(null,username,password,role));
                    request.getRequestDispatcher("register_success.jsp").forward(request,response);
                }
            }else{
                request.setAttribute("msg","验证码错误！");
                request.setAttribute("username",username);
                request.getRequestDispatcher("register.jsp").forward(request,response);
            }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            login(request,response);
        }else{
            register(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }*/
}
