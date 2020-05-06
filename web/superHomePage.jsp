<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/6
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>超级管理员主页</title>
    <style type="text/css">
        #body{
            background-color: coral;
        }

        #box {
            width: 70px;
            margin: 10px;
            padding: 5px;
        }
    </style>
</head>
<body id="body">
<form align="center">
    <h1 align="center">英雄联盟LOL</h1>
    <div align="right">
        <a href="myInformation.jsp">个人信息</a>
        <a href="install.jsp">设置</a>
        <a href="login.jsp">退出登陆</a>
    </div>
    <hr/>
    <h4 align="left">选手信息</h4>
    <ul align="left" value="选手信息">
        <li>大娟</li>
        <li>科名</li>
    </ul>
    <div align="right">
        <input type="text" name="search" id="search"/>
        <input type="button" name="search" id="btn" value="搜索">
    </div>
</form>
</body>
</html>
