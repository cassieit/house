<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/11
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //basepath=http://ip:端口/项目名/
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Author" contect="http://www.webqin.net">
    <title>青年社区</title>
    <%--<link rel="shortcut icon" href="<%=basePath%>images/favicon.ico" />--%>
    <link type="text/css" href="<%=basePath%>css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/js.js"></script>
    <script type="text/javascript">
        $(function(){
            //导航定位
            $(".nav li:eq(6)").addClass("navCur");
        })
    </script>
    <script>
        $(document).ready(function(){

            $.getJSON("<%=basePath%>areaController/queryArea",function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+"<a href=\'javascript:;\'>"+data[i].area_name+"</a>"
                }
                $("#area").html(str);

            });

        });

    </script>
</head>

<body>
<div class="header">
    <div class="width1190">
        <div class="fl">您好${sessionScope.loginUser.user_name}，欢迎来到青年社区！</div>
        <div class="fr">
            <c:if test="${sessionScope.loginUser==null}">  <a href="<%=basePath%>login.jsp">登录</a></c:if>
            <c:if test="${sessionScope.loginUser!=null}"> <a href="<%=basePath%>login.jsp">注销</a></c:if>
            |
            <a href="<%=basePath%>reg.jsp">注册</a> |
            <a href="javascript:;" onclick="AddFavorite(window.location,document.title)">加入收藏</a> |
            <a href="javascript:;" onclick="SetHome(this,window.location)">设为首页</a>
        </div>
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--header/-->
<div class="logo-phone">
    <div class="width1190">
        <%--<h1 class="logo"><a href="<%=basePath%>index.jsp"><img src="images/logo.png" width="163" height="59" /></a></h1>--%>
        <div class="phones"><strong>021-63179891</strong></div>
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--logo-phone/-->
<div class="list-nav">
    <div class="width1190">
        <div class="list">
            <h3>房源分类</h3>
            <div class="list-list">
                <dl>
                    <dt><a href="javascript:;">房源区域</a></dt>
                    <dd id="area">
                        <%--<a href="javascript:;">智慧园</a>--%>
                        <%--<a href="javascript:;">立民村</a>--%>
                        <%--<a href="javascript:;">塘口村</a>--%>
                        <%--<a href="javascript:;">勤劳村</a>--%>
                        <%--<a href="javascript:;">芦胜村</a>--%>
                        <%--<a href="javascript:;">知新村</a>--%>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>pro_zu.jsp">租房</a></dt>
                    <dd>
                        <a href="<%=basePath%>pro_zu.jsp">租金</a>
                        <a href="<%=basePath%>pro_zu.jsp">出租方式</a>
                        <a href="<%=basePath%>pro_zu.jsp">面积</a>
                        <a href="<%=basePath%>pro_zu.jsp">房型</a>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>pro_xin.jsp">新房</a></dt>
                    <dd>
                        <a href="<%=basePath%>pro_xin.jsp">价格</a>
                        <a href="<%=basePath%>pro_xin.jsp">面积</a>
                        <a href="<%=basePath%>pro_xin.jsp">房型</a>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>pro_er.jsp">二手房</a></dt>
                    <dd>
                        <a href="<%=basePath%>pro_er.jsp">价格</a>
                        <a href="<%=basePath%>pro_er.jsp">面积</a>
                        <a href="<%=basePath%>pro_er.jsp">房型</a>
                    </dd>
                </dl>
            </div>
        </div><!--list/-->
        <ul class="nav">
            <li><a href="<%=basePath%>index.jsp">首页</a></li>
            <li><a href="<%=basePath%>pro_zu.jsp">租房</a></li>
            <li><a href="<%=basePath%>pro_xin.jsp">新房</a></li>
            <li><a href="<%=basePath%>pro_er.jsp">二手房</a></li>
            <li><a href="<%=basePath%>user.jsp">个人中心</a></li>
            <div class="clears"></div>
        </ul><!--nav/-->
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--list-nav/-->
<div class="banner" style="background:url(images/ban.jpg) center center no-repeat;"></div>

<div class="content">
    <div class="width1190">
        <div class="vip-left">
            <div class="vipNav">
                <h3 class="vipTitle">会员中心</h3>
                <dl>
                    <dt class="vipIcon3">账户设置</dt>
                    <dd>
                        <a href="<%=basePath%>user.jsp">我的资料</a>
                        <a href="<%=basePath%>user_pwd.jsp" class="vipNavCur">账户密码设置</a>
                    </dd>
                    <dt class="vipIcon1">订单中心</dt>
                    <dd>
                        <a href="http://localhost:8892/orderController/findByUserid">我的订单</a>
                        <%--?users_id=${sessionScope.loginUser.user_id}--%>

                    </dd>
                </dl>
            </div><!--vipNav/-->
        </div><!--vip-left/-->
        <div class="vip-right">
            <h3 class="vipright-title">修改资料</h3>
            <form action="<%=basePath%>userController/updateuser">
                <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
                <input type="hidden" name="user_name" value="${sessionScope.loginUser.user_name}">
                <input type="hidden" name="user_sex" value="${sessionScope.loginUser.user_sex}">
                <input type="hidden" name="user_card" value="${sessionScope.loginUser.user_card}">

            <table class="grinfo">
                <tbody>
                <tr>
                    <th>注册手机号：</th>
                    <td > <input class="inp inw" readonly="readonly" name="user_tel" value="${sessionScope.loginUser.user_tel}"></input></td>
                </tr>
                <tr>
                    <th>新密码：</th>
                    <td>
                        <input class="inp inw" name="user_pwd" onblur="checkpwd()" type="password" id="new_password" placeholder="不少于6位">
                        <span id="showerror2"></span>
                    </td>

                </tr>
                <tr>
                    <th>重复新密码：</th>
                    <td>
                        <input class="inp inw" name="user_pwd1" onblur="recheckpwd()" type="password" id="new_password1" placeholder="不少于6位">
                        <span id="showerror3"></span>
                    </td>

                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <td colspan="2">
                        <label class="butt" id="butt">
                            <input type="submit" class="member_mod_buttom" onclick="return checkall()" value="确认修改" />
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div><!--vip-right/-->
        <div class="clearfix"></div>
    </div><!--width1190/-->
</div><!--content/-->
<div class="footer">
    <div class="width1190">
        <div class="fl"><a href="<%=basePath%>index.jsp"><strong>青年社区</strong></a><a href="<%=basePath%>about.jsp">关于我们</a><a href="<%=basePath%>contact.jsp">联系我们</a><a href="<%=basePath%>user.jsp">个人中心</a></div>

        <%--<div class="clears"></div>--%>
    </div><!--width1190/-->
</div><!--footer/-->
</body>
<script>

    function checkpwd(){
        var op=document.getElementById("new_password").value;
        if(op==null||op==''||op.length<6){
            $("#showerror2").html("<img src=\"<%=basePath%>images/fail.png\"/>密码必须大于等于6位")
            return false;
        }else{
            $("#showerror2").html("<img src=\"<%=basePath%>images/success.png\"/>");
            return true;
        }
    }

    function recheckpwd(){
        var op1=document.getElementById("new_password1").value;
        var op2=document.getElementById("new_password").value;
        if(op1.length<6&&op2.length<6){
            //if(op1!=null&&op1!=''&&op2!=null&&op2!=''&&op1.length<6&&op2.length<6){
            $("#showerror3").html("<img src=\"<%=basePath%>images/fail.png\"/>密码必须大于等于6位")
            return false;
        }else if (op1==op2){
            $("#showerror3").html("<img src=\"<%=basePath%>images/success.png\"/>");
            return true;
        } else{
            $("#showerror3").html("<img src=\"<%=basePath%>images/fail.png\"/>密码前后不一致")
            return false;
        }
    }


    function checkall(){

        return checkpwd()&&recheckpwd();
    }

</script>
</html>

