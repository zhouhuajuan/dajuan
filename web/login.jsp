<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/3
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
    Cookie[] cookies = request.getCookies();
    String username = "";
    String password = "";
    if(cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            }else if (cookie.getName().equals("password")) {
                password = cookie.getValue();
            }
        }
    }
%>--%>
<html>
<head>
    <title>用户登陆</title>
    <style type="text/css">
        .form{
            border: 1px solid black;
            background-color: bisque;
            width: 430px;
            height: 300px;
            margin-left: auto;
            margin-right:auto;
            font-size: 20px;
        }

        #body{
            background-color: coral;
        }

        .errorMsg{
            font-size: 14px;
            color: red;
        }

        .role{
            font-size: 14px;
        }
    </style>
</head>
<body id="body">
<h1 align="center">用户登陆</h1>
<br/>
<div class="form">
    <form action="LoginServlet" method="post">
        <input type="hidden" name="action" value="login"/>
        &nbsp;
        <label>登陆账号</label>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <span class="errorMsg">
            <%--<%=request.getAttribute("msg")==null?"请输入用户名和密码":request.getAttribute("msg")%>--%>
            ${empty requestScope.msg ?"请输入用户名和密码":requestScope.msg}
        </span>
        <br/>
        <br/>
        &nbsp;
        <label>身份：</label>
        <label>
            <input type="radio" name="role" value="player" class="role" checked="checked"/>
            选手
        </label>
        <label>
            <input type="radio" name="role" value="manager" class="role"/>
            战队管理员
        </label>
        <label>
            <input type="radio" name="role" value="superManager" class="role"/>
            超级管理员
        </label>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <label>用户名称：</label>
        <label>
            <input type="text" name="username"
                   value="${requestScope.username}"/>
        </label>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <label>用户密码：</label>
        <label>
            <input type="password" name="password"/>
        </label>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        &nbsp;
        <input type="submit" value="登陆" style="width: 150px;height: 30px"/>
        &nbsp;
        &nbsp;
        <input type="reset" value="重置" style="width: 150px;height: 30px"/>
    </form>
</div>
<br/>
<br/>
<div align="center"><a href="forgetPassword.jsp">忘记密码？</a></div>
</body>
</html>
