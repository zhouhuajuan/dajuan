<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/5/3
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="css/style.03.css"/>

</head>
<body>
<form>
    <h1 align="center">个人信息</h1>
    <table>
        <tr>
            <td>头像：</td>
            <td><input type="image" name="file" alt=""/></td>
        </tr>
        <tr>
            <td>昵称：</td>
            <td>
                <label>
                    <input type="text" name="name" />
                </label>
            </td>
        </tr>
        <tr>
            <td>账号名：</td>
            <td>
                <label>
                    <input type="text" name="username"/>
                </label>
            </td>
        </tr>
        <tr>
            <td>性别：</td>
            <td>
                <label>
                    <input type="radio" name="sex" checked="checked" value="boy"/>
                    男
                </label>
                <label>
                    <input type="radio" name="sex" value="gril"/>
                    女
                </label>
            </td>
        </tr>
        <tr>
            <td>年龄阶段：</td>
            <td>
                <label>
                    <select>
                        <option>--请选择年龄阶段--</option>
                        <option>60后</option>
                        <option>70后</option>
                        <option>80后</option>
                        <option>90后</option>
                        <option>00后</option>
                        <option>10后</option>
                    </select>
                </label>
            </td>
        </tr>
        <tr>
            <td>职业：</td>
            <td>
                <label>
                    <select>
                        <option>---请选择你的职业---</option>
                        <option>计算机/互联网/通信</option>
                        <option>生产/工艺/制造</option>
                        <option>医疗/护理/制药</option>
                        <option>金融/银行/投资/保险</option>
                        <option>商业/服务业/个体经营</option>
                        <option>文化/广告/传媒</option>
                        <option>娱乐/艺术/表演</option>
                        <option>律师/法务</option>
                        <option>教育/培训</option>
                        <option>公务员/行政/事业单位</option>
                        <option>模特</option>
                        <option>空姐</option>
                        <option>学生</option>
                        <option>其他职业</option>
                    </select>
                </label>
            </td>
        </tr>
        <tr>
            <td>个性签名：</td>
            <td>
                <label>
                    <textarea rows="5" cols="30" >快来编辑你的个性签名吧~</textarea>
                </label>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
