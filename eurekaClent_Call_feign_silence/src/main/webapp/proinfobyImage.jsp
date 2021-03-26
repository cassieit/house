<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //basepath=http://ip:端口/项目名/
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            //$(".nav li:eq(6)").addClass("navCur");
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
        <%--<h1 class="logo"><a href="index.jsp"><img src="<%=basePath%>images/logo.png" width="163" height="59" /></a></h1>--%>
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
                    <dt><a href="pro_zu.jsp">租房</a></dt>
                    <dd>
                        <a href="pro_zu.jsp">租金</a>
                        <a href="pro_zu.jsp">出租方式</a>
                        <a href="pro_zu.jsp">面积</a>
                        <a href="pro_zu.jsp">房型</a>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="pro_xin.jsp">新房</a></dt>
                    <dd>
                        <a href="pro_xin.jsp">价格</a>
                        <a href="pro_xin.jsp">面积</a>
                        <a href="pro_xin.jsp">房型</a>
                    </dd>
                </dl>
                <dl>
                    <dt><a href="pro_er.jsp">二手房</a></dt>
                    <dd>
                        <a href="pro_er.jsp">价格</a>
                        <a href="pro_er.jsp">面积</a>
                        <a href="pro_er.jsp">房型</a>
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
<div class="banner" style="background:url(<%=basePath%>images/ban.jpg) center center no-repeat;"></div>

<div class="content">
    <div class="width1190" style="width:1000px;">
        <div class="proImg fl">

            <img src="<%=basePath%>images/houses/${sessionScope.houses.houses_image}" />
        </div><!--proImg/-->
        <div class="proText fr">
            <h3 class="proTitle">${sessionScope.houses.houses_name} </h3>
            <div class="proText1">
                编号：${sessionScope.houses.houses_id}<br />
                户型：${sessionScope.houses.houses_style}<br />
                面积：${sessionScope.houses.houses_areas}㎡<br />
                朝向：${sessionScope.houses.houses_toward}<br />
                楼层：${sessionScope.houses.houses_storey}层/30层<br />
                装修：${sessionScope.houses.houses_decorate}<br />
                小区：${sessionScope.houses.houses_addr}
            </div>
            <div class="xun-car">
                <a href="javascript:;" class="xwjg">¥<strong>${sessionScope.houses.houses_price}</strong>元</a>
                <a href="javascript:;" class="projrgwc">关注房源</a>
            </div><!--xun-car/-->
        </div><!--proText/-->
        <div class="clears"></div>
    </div><!--width1190/-->
    <div class="proBox" style="width:1000px;margin:10px auto;">
        <div class="proEq">
            <ul class="fl">
                <li class="proEqCur">房源详情</li>
                <li><a href="http://localhost:8892/imagesController/queryByHousesId1?houses_id=1">房源图片</a></li>
                <li>小区介绍</li>
            </ul>
            <div class="lxkf fr"><a href="http://wpa.qq.com/msgrd?v=3&uin=1072631488&site=qq&menu=yes" target="_blank"></a></div>
            <div class="clears"></div>
        </div><!--proEq/-->
        <div class="proList">

            ${sessionScope.houses.houses_info}<br />
            <br/>
<div id="aa">
                </div>
        </div><!--proList/-->
        <div class="proList">
<c:forEach items="${images}" var="images">
            <img src="<%=basePath%>images/houses/${images.images_name}" />
</c:forEach>
        </div><!--proList/-->
        <div class="proList">
            暂无信息...
        </div><!--proList/-->
    </div><!--proBox/-->
</div><!--content/-->

<div class="footer">
    <div class="width1190">
        <div class="fl"><a href="<%=basePath%>index.jsp"><strong>青年社区</strong></a><a href="<%=basePath%>about.jsp">关于我们</a><a href="<%=basePath%>contact.jsp">联系我们</a><a href="<%=basePath%>user.jsp">个人中心</a></div>

        <%--<div class="clears"></div>--%>
    </div><!--width1190/-->
</div><!--footer/-->
</body>
</html>
