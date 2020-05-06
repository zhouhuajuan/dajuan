package com.zhj.event.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistServlet",urlPatterns = "/RegistServlet")
public class RegistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // 获取session中的验证码
            String sessionCode = (String) request.getSession().getAttribute("code");
            System.out.println(sessionCode);

            if(sessionCode != null) {
                //  获取页面提交的验证码
                String inputCode = request.getParameter("code");
                System.out.println("页面提交的验证码:" + inputCode);
                if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    System.out.println("页面提交:" + username+password);
                    //  验证成功，跳转成功页面
                    request.setAttribute("username", username);
                    request.getRequestDispatcher("/success.jsp").forward(request, response);
                }else {
                    //  验证失败
                    request.getRequestDispatcher("fail.jsp").forward(request, response);
                }
            }else {
                //  验证失败
                request.getRequestDispatcher("fail.jsp").forward(request, response);
            }
            //  移除session中的验证码
            request.removeAttribute("code");
    }
}
