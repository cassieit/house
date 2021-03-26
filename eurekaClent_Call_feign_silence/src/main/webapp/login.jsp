<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/8
  Time: 15:02
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
    <link type="text/css" href="css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
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
        <div class="fl">您好，欢迎来到青年社区！</div>
        <div class="fr">
            <a href="<%=basePath%>login.jsp">登录</a> |
            <a href="<%=basePath%>reg.jsp">注册</a> |
            <a href="javascript:;" onclick="AddFavorite(window.location,document.title)">加入收藏</a> |
            <a href="javascript:;" onclick="SetHome(this,window.location)">设为首页</a>
        </div>
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--header/-->
<div class="logo-phone">
    <div class="width1190">
        <%--<h1 class="logo"><a href="<%=basePath%>index.jsp"><img src="<%=basePath%>images/logo.png" width="163" height="59" /></a></h1>--%>
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
        <div class="reg-logo">
            <form id="signupForm" method="post" action="<%=basePath%>userController/checkLogin" class="zcform">
                <p class="clearfix">
                    <label class="one" for="agent">用户名：</label>
                    <input id="agent" name="user_name" type="text" class="required" value placeholder="请输入您的用户名" />

                </p>
                <p class="clearfix">
                    <label class="one"  for="password">登录密码：</label>
                    <input id="password" name="user_pwd" type="password" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
                </p>
                <%--<p class="clearfix">--%>
                    <%--<label class="one"  for="checkyan">验证码：</label>--%>
                    <%--<input id="checkyan" name="user_check" type="text" style="height: 30px" class="{required:true,rangelength:[8,20],}" value placeholder="请输入验证码" />--%>
                    <%--<span><img src="image.jsp" onclick="this.src='image.jsp?id='+Math.random()" /></span>--%>
                <%--</p>--%>
                <!--<p class="clearfix agreement">
                    <input type="checkbox" />
                    <b class="left">已阅读并同意<a href="#">《用户协议》</a></b>
                </p>-->
                <p class="clearfix"><input class="submit" type="submit" value="立即登录"/></p>
            </form>
            <div class="reg-logo-right">
                <h3>如果您没有账号，请</h3>
                <a href="<%=basePath%>reg.jsp" class="logo-a">立即注册</a>
            </div><!--reg-logo-right/-->
            <div class="reg-logo-right">
                <h3>忘记密码？点击重置</h3>
                <a href="<%=basePath%>repwd.jsp" class="logo-a">重置密码</a>
            </div>
            <div class="clears"></div>
        </div><!--reg-logo/-->
    </div><!--width1190/-->
</div><!--content/-->
<div class="footer">
    <div class="width1190">
        <div class="fl"><a href="<%=basePath%>index.jsp"><strong>青年社区</strong></a><a href="<%=basePath%>about.jsp">关于我们</a><a href="<%=basePath%>contact.jsp">联系我们</a><a href="<%=basePath%>user.jsp">个人中心</a></div>

        <%--<div class="clears"></div>--%>
    </div><!--width1190/-->
</div><!--footer/-->
</body>
</html>
