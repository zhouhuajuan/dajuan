<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/3
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
</head>
<body>
    <form>
        <table>
            <tr>
                <td>用户名：</td>
                <td><label>
                    <input type="text" name="username"/>
                </label></td>
            </tr>
            <tr>
                <td><input type="button" value="获取验证码" /></td>
                <td><label>
                    <input type="text" name="code"/>
                </label></td>
            </tr>
        </table>
    </form>
</body>
</html>
