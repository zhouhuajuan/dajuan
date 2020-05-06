<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/6
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>使用邮箱验证码实现注册</title>
    <script type="text/javascript" src="script/jquery-1.7.2.js"></script>

</head>
<body>
<!--登录注册表-->
<div>
    <form id="form">
        <div class="flrg-1">
            <h3>注册</h3>
            <div>
                <input type="text" class="in-1" placeholder="您的用户名"
                       name="username" id="username" onblur="checkNotName()"> <br>
                <font color="red" id="usernameError"></font>
            </div>
            <div class="a">
                <input type="password" class="in-1" placeholder="输入密码" name="pwd"
                       id="pwd" onblur="checkPwd()"> <br> <font
                    color="red" id="pwdError"></font>
            </div>
            <div class="a">
                <input type="password" class="in-1" placeholder="再次确认密码"
                       name="repwd" id="rePwd" onblur="checkRePwd()"> <br>
                <font color="red" id="rePwdError"></font>
            </div>
            <div class="a">
                <input type="text" class="in-1" placeholder="输入手机号码" name="phone"
                       id="phone" onblur="checkPhone()"> <br> <font
                    color="red" id="phoneError"></font>
            </div>
            <div class="a">
                <input type="email" class="in-1" placeholder="输入邮箱地址" name="email"
                       id="email" onblur="checkEmail()"> <br> <font
                    color="red" id="emailError"></font>
            </div>
            <div class="a">
                <input type="text" class="in-1" placeholder="邮箱验证码" name="eCode"
                       id="eCode"> <br> <font color="red" id="eCodeError"></font>
            </div>
            <div class="a">
                <input type="button" id="send" value="发送邮箱验证码">
            </div>
            <div class="a">
                <input type="button" id="btn" style="text-align: center;"
                       value="注册">
            </div>
            <script>
                $("#send").click(function(){
                    var email = $("#email").val();
                    var result = "ok";
                    $.ajax({
                        type:"post",
                        async:true,
                        url:"SendEmailVilidataCodeServlet",
                        data:"firstEmail="+email,
                        dataType:"json",
                        success:function(sendResult){
                            if(result==sendResult){
                                alert("已发送成功，注意查收");
                            }else{
                                $("#send").val("请重新发送");
                            }
                        },
                        error:function(){
                            alert("发送验证码失败");
                        }
                    })
                });
            </script>
            <script>
                $("#btn").click(function(){
                    var username = $("#username").val();
                    var pwd = $("#pwd").val();
                    var rePwd = $("#rePwd").val();
                    var phone = $("#phone").val();
                    var eCode = $("#eCode").val();
                    var email = $("#email").val();
                    var result = "ok";
                    $.ajax({
                        type:"post",
                        async:true,
                        //最好使用绝对路径
                        url:"${pageContext.request.contextPath}/RegisterServlet",
                        data:"username="+username+"&pwd="+pwd+"&rePwd="+rePwd+"&eCode="+eCode+"&email="+email+"&phone="+phone,
                        dataType:"json",
                        success:function(resultFinal){
                            if(result==resultFinal){
                                alert(resultFinal);
                                window.location.href="login.jsp";
                            }else{
                                $("#eCodeError").html(resultFinal);
                            }
                        },
                        error:function(){
                            alert("注册失败");
                        }
                    })
                });
            </script>
        </div>
    </form>
</div>
</body>
</html>