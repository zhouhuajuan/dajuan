<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/6
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>邮箱注册</title>
    <script type="text/javascript" src="script/jquery-1.7.2.js"></script>
    <%--<script type="text/javascript" src="js/bootstrap.min.js"></script>--%>

    <style type="text/css">
        #register {
            width: 450px;
            height: 100px;
            margin: 50px auto;
        }

        #btn {
            margin-left: 197px;
            margin-top: -24px;
            width: 120px;
            height: 25px;
            font-size: 14px;
            color: #7904c9
        }

        body {
            background-color: #ecfcf9;
        }
    </style>


    <script type="text/javascript">
        $(function(){
            $("#btn").click(function(){
                    if($("#email").val()){
                        $.ajax({
                            type:"POST",
                            url :"SendEmailServlet?random"+Math.random(),
                            data:{
                                email:$("#email").val(),
                            },
                            success:function(data){
                                alert("验证码发送成功，请注意查收。");
                            },
                        })
                    }else{
                        alert("邮箱发送失败");
                        $("#notice").html("请填写邮箱");
                        setTimeout(function(){
                            $("#notice").hide();
                        },1000);
                    }
                }
            );
            //  判断用户是否可以注册
            $("#submit").click(function() {
                if ($("#email").val()) {
                    $("#RegistForm").submit();
                } else { //  如果没有值
                    $("#notice").html("请填写完整信息");
                    setTimeout(function() {
                        $("#notice").hide();
                    }, 1000);
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div id="register">
        <form class="form-horizontal" id="RegistForm" method="post"
              action="${pageContext.request.contextPath}/RegistServlet">
            <fieldset>
                <div id="legend" class="">
                    <legend class="">用户注册</legend>
                </div>
                <div class="form-group">
                    <!-- Text input-->
                    <label class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-5">
                        <label>
                            <input type="text" placeholder="请输入6位数账号..." class="form-control"
                                   required name="username">
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-5">
                        <input type="password" placeholder="请输入6位数密码..." required
                               class="form-control" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-5">
                        <input type="email" placeholder="请填写邮箱地址..." class="form-control"
                               id="email" name="email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-5">
                        <input type="text" name="code" id="code" placeholder="请输入邮箱的验证码"
                               class="form-control" required>
                        <input type="button" name="btn"
                               class="btn btn-default" id="btn" value="发送验证码" />
                    </div>
                </div>
                <span id="notice" class="hide">请先完成邮箱验证</span><br />
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="login.jsp" class="btn btn-success">返回登录</a> <input
                            class="btn btn-info" type="submit" id="submit" value="邮箱注册" />
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>
