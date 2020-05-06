package com.zhj.event.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ForgetPassServlet",urlPatterns = "/ForgetPassServlet")
public class ForgetPassServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        // 获取session中的验证码
        String sessionCode = (String) request.getSession().getAttribute("code");
        System.out.println(sessionCode);
        String inputCode = request.getParameter("code");
        System.out.println("页面提交的验证码:" + inputCode);

        if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
            request.getRequestDispatcher("login_success.jsp").forward(request,response);
        }else {
            request.setAttribute("msg","验证码错误！");
            request.setAttribute("username",username);
            request.getRequestDispatcher("forgetPassword.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
