<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/2
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选手注册</title>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
    <script>
        $(function () {
            $("#sub_btn").click(function(){
                var nameText = $("#name").val();
                if(nameText == null || nameText === ""){
                    $("span.errorMsg").text("姓名不能为空！");
                    return false;
                }

                var ageText = $("#age").val();
                if(ageText == null || ageText === ""){
                    $("span.errorMsg").text("年龄不能为空！");
                    return false;
                }

                var validityText = $("#validity").val();
                if(validityText == null || validityText === ""){
                    $("span.errorMsg").text("个人简介不能为空！");
                    return false;
                }

                var lastTeamText = $("#lastTeam").val();
                if(lastTeamText == null || lastTeamText === ""){
                    $("span.errorMsg").text("效力的上一个战队不能为空！");
                    return false;
                }

                var dateText = $("#date").val();
                if(dateText == null || dateText === ""){
                    $("span.errorMsg").text("加入的LPL的时间不能为空！");
                    return false;
                }
            });
        });
    </script>
    <style type="text/css">
        .form{
            border: 1px solid black;
            background-color: bisque;
            width: 440px;
            height: 450px;
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
    <input type="hidden" value=""/>
    <h1 align="center">选手注册需要完善个人简介</h1>
    <div class="form">
        <form action="UploadServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
            <br/>
            <span class="errorMsg">
                ${requestScope.msg}
            </span>
            <br/>
            &nbsp;
            <label>头像：</label>
            <label>
                <input type="file" name="file" id="file" multiple="multiple"/>
            </label>
            <br/>
            &nbsp;
            <label>姓名：</label>
            <label>
                <input type="text" name="name" id="name"/>
            </label>
            <br/>
            <br/>
            &nbsp;
            <label>年龄：</label>
            <label>
                <input type="text" name="age" id="age"/>
            </label>
            <br/>
            <br/>
            &nbsp;
            <label>个人简介：</label>
            <label>
                <textarea rows="5" cols="30" name="validity" id="validity"></textarea>
            </label>
            <br/>
            <br/>
            &nbsp;
            <label>效力的上一个战队：</label>
            <label>
                <input type="text" name="lastTeam" id="lastTeam"/>
            </label>
            <br/>
            <br/>
            &nbsp;
            <label>加入的LPL的时间：</label>
            <label>
                <input type="text" name="date" id="date" placeholder="年-月-日" autocomplete="off"
                       tabindex="1"/>
                <%--<select name="year" id="year">
                    <option value="2013年">2013年</option>
                    <option value="2014年">2014年</option>
                    <option value="2015年">2015年</option>
                    <option value="2016年">2016年</option>
                    <option value="2017年">2017年</option>
                    <option value="2018年">2018年</option>
                    <option value="2019年">2019年</option>
                    <option value="2020年">2020年</option>
                </select>
                <select name="month" id="month">
                    <option value="1月">1月</option>
                    <option value="2月">2月</option>
                    <option value="3月">3月</option>
                    <option value="4月">4月</option>
                    <option value="5月">5月</option>
                    <option value="6月">6月</option>
                    <option value="7月">7月</option>
                    <option value="8月">8月</option>
                    <option value="9月">9月</option>
                    <option value="10月">10月</option>
                    <option value="11月">11月</option>
                    <option value="12月">12月</option>
                </select>--%>
                <br/>
                <br/>
            </label>
            <label>
                &nbsp;
                &nbsp;
                &nbsp;
                &nbsp;
                <input type="submit" value="提交" id="sub_btn" style="width: 150px;height: 30px"/>
                &nbsp;
                &nbsp;
                <input type="reset" value="重置" style="width: 150px;height: 30px"/>
            </label>
        </form>
    </div>
</body>
</html>
