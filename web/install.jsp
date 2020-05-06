<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/3
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设置</title>
    <script>
        function onclickFun(){
            var passwordObj = document.getElementById("password");
            var passwordText = passwordObj.value;
            var patt = /^\w{8,16}$/;
            if(patt.test(passwordText)){
                return window.location.href='register_success.jsp';
            }else {
                alert("密码格式不符合规定！");
                return false;
            }
        }
    </script>
    <style type="text/css">
        #table{
            border: 1px solid black;
            background-color: bisque;
            width: 370px;
            height: 260px;
            margin-left: auto;
            margin-right:auto;
            font-size: 20px;
        }
        #body{
            background-color: coral;
        }
    </style>
</head>
<body id="body">
<form>
    <h1 align="center">修改密码</h1>
    <table id="table">
        <tr>
            <td>原密码：</td>
            <td><label>
                <input type="text" name="password"/>
            </label></td>
        </tr>
        <tr>
            <td>新密码：</td>
            <td><label for="password"></label><input type="text" name="newPass" id="password"/></td>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><label>
                <input type="text" name="newPass"/>
            </label></td>
        </tr>
    </table>
    <br/>
    <div align="center"> ! 密码必须是8-16位数字、字母、下划线的组合（不能是纯数字）</div>
    <br/>
    <div align="center"><button style="width: 150px;height: 30px" onclick="return onclickFun()">确认</button></div>
    <br/>
    <br/>
    <br/>
    <div align="center"><a href="getOldPassword.jsp">忘记原密码？</a></div>
</form>
</body>
</html>
