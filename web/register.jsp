<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/2
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <script type="text/javascript" src="script/jquery-1.7.2.js"></script>
    <script>
        $(function () {
            $("#btn").click(function(){
                    if($("#username").val()){
                        $.ajax({
                            type:"POST",
                            url :"SendEmailServlet?random"+Math.random(),
                            data:{
                                email:$("#username").val(),
                            },
                            success:function(data){
                                alert("验证码发送成功，请注意查收。");
                            },
                        })
                    }else{
                        alert("邮箱发送失败");
                        $("span.errorMsg").text("请填写邮箱！");
                        setTimeout(function(){
                            $("span.errorMsg").text("");
                        },1000);
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

                /*规则：
               1、不能以0字开头
               2、@
               3、必须是数字与字母组成，长度为2-10位
               4、结尾一组，字母长度为2-4位
               5、 .字母，最少一组，最多三组*/
                var usernameText = $("#username").val();
                var usernamePatt = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
                if(!usernamePatt.test(usernameText)){
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                }

                var passwordText = $("#password").val();
                var passPatt = /^\w{8,16}$/;
                if(!passPatt.test(passwordText)){
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                }

                var newPassText = $("#newPass").val();
                if(newPassText != passwordText){
                    $("span.errorMsg").text("确认密码和密码不一致!");
                    return false;
                }
                $("span.errorMsg").text("");
            });
        });
    </script>
    <style type="text/css">
        .form{
            border: 1px solid black;
            background-color: bisque;
            width: 400px;
            height: 370px;
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
    </style>
</head>
<body id="body">
    <h1 align="center">用户注册</h1>
    <br/>
    <div class="form">
        <form action="RegisterServlet" method="post">
            <input type="hidden" name="action" value="register"/>
            &nbsp;
            &nbsp;
            <label>注册账号</label>
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
            <label>请选择身份：</label>
            <label>
                <input type="radio" name="role" value="player" checked="checked"/>
                选手
            </label>
            <label>
                <input type="radio" name="role" value="manager"/>
                战队管理员
            </label>
            <br/>
            <br/>
            &nbsp;
            &nbsp;
            <label>用户名称：</label>
            <label for="username"></label><input type="text" placeholder="请输入邮箱地址" autocomplete="off"
                                                 tabindex="1" name="username" id="username"
                                                 value="${requestScope.username}"/>
            <br/>
            <br/>
            &nbsp;
            &nbsp;
            <label>用户密码：</label>
            <label for="password"></label><input type="text" placeholder="请输入密码" autocomplete="off"
                                             tabindex="1" name="password" id="password"/>
            <br/>
            <br/>
            &nbsp;
            &nbsp;
            <label>确认密码：</label>
            <label><input type="text" placeholder="确认密码" autocomplete="off" tabindex="1" name="password"
                            id="newPass"/></label>
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
            &nbsp;
            <input type="submit" value="注册" id="sub_btn" style="width: 150px;height: 30px"/>
            &nbsp;
            &nbsp;
            <input type="reset" style="width: 150px;height: 30px"/>
        </form>
    </div>
    <br/>
    <div align="center">! 密码必须是8-16位数字、字母、下划线的组合（不能是纯数字）</div>
</body>
</html>
