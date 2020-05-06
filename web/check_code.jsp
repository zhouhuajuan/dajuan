<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/4
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图形验证</title>
    <style type="text/css">
        #table{
            border: 1px solid black;
            background-color: bisque;
            width: 440px;
            height: 300px;
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
        <table id="table">
            <tr>
                <td><label>
                    <input type="text" name="codeText"/>
                </label></td>
                <td><button name="getCode">获取验证码</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
