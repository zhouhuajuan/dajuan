package com.zhj.event.web;

import com.zhj.event.bean.User;
import com.zhj.event.service.UserService;
import com.zhj.event.service.impl.UserServiceImpl;
import com.zhj.event.util.MD5Util;
import com.zhj.event.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet",urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        //实例化一个md5Util对象，调用md5()方法对密码做加密处理
        MD5Util md5Util = new MD5Util();
        String password = null;
        try {
            password = md5Util.md5(pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String role = request.getParameter("role");

        // 获取session中的验证码
        String sessionCode = (String) request.getSession().getAttribute("code");
        System.out.println(sessionCode);
        String inputCode = request.getParameter("code");
        System.out.println("页面提交的验证码:" + inputCode);

        /*User user = new User();
        WebUtil.copyParamToBean(request.getParameterMap(),user);*/

        if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
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
        //  移除session中的验证码
        request.removeAttribute("code");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
