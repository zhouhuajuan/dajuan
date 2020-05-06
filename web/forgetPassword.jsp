<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/3
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
    <script type="text/javascript" src="script/jquery-1.7.2.js"></script>
    <script>
        $(function () {
            $("#btn").click(function () {
                    if ($("#username").val()) {
                        $.ajax({
                            type: "POST",
                            url: "SendEmailServlet?random" + Math.random(),
                            data: {
                                email: $("#username").val(),
                            },
                            success: function (data) {
                                alert("验证码发送成功，请注意查收。");
                            },
                        })
                    } else {
                        alert("邮箱发送失败");
                        $("span.errorMsg").text("请填写邮箱！");
                        setTimeout(function () {
                            $("span.errorMsg").text("");
                        }, 1000);
                    }
                }
            );

            $("#sub_btn").click(function () {
                var codeText = $("#code").val();

                //去掉验证码前后空格
                $.trim(codeText);
                if(codeText == null || codeText == ""){
                    $("span.errorMsg").text("验证码不能为空！");
                    return false;
                }

                var usernameText = $("#username").val();
                var usernamePatt = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
                if(!usernamePatt.test(usernameText)){
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }
                $("span.errorMsg").text("");
            });
        });
    </script>
    <style type="text/css">
        .errorMsg{
            font-size: 14px;
            color: red;
        }

        .form{
            border: 1px solid black;
            background-color: bisque;
            width: 340px;
            height: 220px;
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
<h1 align="center">忘记密码</h1>
<br/>
<div class="form">
    <form action="ForgetPassServlet" method="post">
        <input type="hidden" name="action" value="forgetPassword"/>
        &nbsp;
        &nbsp;
        <label>获取验证码登陆</label>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;
        <span class="errorMsg">
            ${requestScope.msg}
        </span>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        <label>用户名：</label>
        &nbsp;
        &nbsp;
        <label for="username"></label><input type="text" placeholder="请输入邮箱地址" autocomplete="off"
                                             tabindex="1" name="username" id="username"
                                             value="${requestScope.username}"/>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        <input type="button" value="获取验证码" name="btn" id="btn"/>
        &nbsp;
        &nbsp;
        <label for="code"></label><input type="text" name="code" id="code" placeholder="请输入邮箱的验证码"
                                         autocomplete="off" tabindex="1"/>
        <br/>
        <br/>
        &nbsp;
        &nbsp;
        <input type="submit" value="登陆" id="sub_btn" style="width: 130px;height: 27px"/>
        &nbsp;
        <input type="reset" style="width: 130px;height: 27px"/>
    </form>
</div>
</body>
</html>
