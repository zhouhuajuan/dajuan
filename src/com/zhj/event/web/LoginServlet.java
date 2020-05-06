package com.zhj.event.web;

import com.zhj.event.bean.User;
import com.zhj.event.service.UserService;
import com.zhj.event.service.impl.UserServiceImpl;
import com.zhj.event.util.MD5Util;
import sun.plugin.dom.core.Element;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    /**
     * 设置输错密码的次数
     */
    int failCount = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password1 = request.getParameter("password");
        //实例化一个md5Util对象，调用md5()方法对密码做加密处理
        MD5Util md5Util = new MD5Util();
        String password2 = null;
        try {
            password2 = md5Util.md5(password1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String role = request.getParameter("role");
        /*Cookie cookie = new Cookie("username", username);
        Cookie cookie2 = new Cookie("password", password);
        response.addCookie(cookie);
        response.addCookie(cookie2);*/
        User loginUser = userService.login(new User(null,username,null,role));
        if(loginUser == null){
            request.setAttribute("msg","用户名错误！");
            request.setAttribute("username",username);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            String password3 = loginUser.getPassword();
            if (Objects.equals(password2, password3)){
                request.getRequestDispatcher("login_success.jsp").forward(request,response);
            }else {
                request.setAttribute("msg","密码错误！");
                request.setAttribute("username",username);
                failCount++;
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }

            //本计划把用户名传到主页的里
            /*loginUser.setUsername(username);
            loginUser.setPassword(password);
            loginUser.setRole(role);
            Element session = null;
            assert false;
            session.setAttribute("userNow", String.valueOf(loginUser));*/
        }
        //输错密码三次则须进行图形认证
        if(failCount >=3){
            request.getRequestDispatcher("check_code.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
