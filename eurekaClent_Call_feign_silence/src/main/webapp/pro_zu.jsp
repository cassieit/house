<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/12
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //basepath=http://ip:端口/项目名/
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            $(".nav li:eq(1)").addClass("navCur");
        })
    </script>
    <script>
        $(document).ready(function(){
            $.getJSON("<%=basePath%>housesController/queryNew",function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+" <dl>" +
                        "                <dt><a href=<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'><img src='<%=basePath%>images/houses/"+data[i].houses_image+"' width='286' height='188' /></a></dt>" +
                        "                <dd>" +
                        "                    <h3><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'></a>"+data[i].houses_name+"</h3>" +
                        "                    <div class='hui'>"+data[i].houses_style+" | "+data[i].houses_area+"m²| "+data[i].houses_decorate+"</div>" +
                        "                </dd>" +
                        "            </dl>"
                }
                $("#bb").html(str);

            });

        });

    </script>
    <script>
        $(document).ready(function(){
            $.getJSON("<%=basePath%>userController/queryAllHouses4",function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+" <dl>"+
                        "<dt><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'><img src='<%=basePath%>images/houses/"+data[i].houses_image+"' style='width: 286px;height: 188px' /></a></dt>"+
                    "<dd>"+
                    "<h3><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+">"+data[i].houses_name+"</a></h3>"+
                    "<div class='pro-wei'>"+
                        "<img src='<%=basePath%>images/weizhi.png' width='12' height='16' /> <strong class='red'>"+data[i].area_name+"</strong>"+
                        "</div>"+
                        "<div class='pro-fang'>"+data[i].houses_style+" "+data[i].houses_areas+"平 "+data[i].houses_toward+"楼层"+data[i].houses_storey+"/30层</div>"+
                    "<div class='pra-fa'>发布人："+data[i].admin_name+"  发布时间："+data[i].houses_time+"</div>"+
                    "</dd>"+
                    "<div class='price'>¥ <strong>"+data[i].houses_price+"</strong><span class='font12'>元/月</span></div>"+
                    "<div class='clears'></div>"+
                        "</dl>"
                }
                $("#index").html(str);

            });

        });

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
<div class="banner" style="background:url(<%=basePath%>images/ban.jpg) center center no-repeat;"></div>

<div class="content">
    <div class="width1190">
        <form action="#" method="get" class="pro-search">
            <table>
                <tr>
                    <th>房源区域：</th>
                    <td>
                        <a href="javascript:;" class="pro-cur">不限</a>
                        <a href="javascript:;">西城区</a>
                        <a href="javascript:;">东城区</a>
                        <a href="javascript:;">朝阳区</a>
                        <a href="javascript:;">海淀区</a>
                        <a href="javascript:;">昌平区</a>
                        <a href="javascript:;">顺义区</a>
                    </td>
                </tr>
                <tr style="height: 42.4px">
                    <th style="height: 42.4px">租金：</th>
                    <td style="height: 42.4px">
                        <a href="javascript:;" class="pro-cur">不限</a>
                        <a href="javascript:;">500-1000</a>
                        <a href="javascript:;">1001-2000</a>
                        <a href="javascript:;">2001-3000</a>
                        <a href="javascript:;">3001-4000</a>
                        <input type="text" class="protext" style="width: 50px" /> - <input type="text" class="protext" style="width: 50px"/> 元
                        <input type="submit" class="proSub"  value="确定" />
                    </td>
                </tr>
                <tr>
                    <th>出租方式：</th>
                    <td>
                        <a href="javascript:;" class="pro-cur">不限</a>
                        <a href="javascript:;">短租</a>
                        <a href="javascript:;">长租</a>
                        <a href="javascript:;">合租</a>
                        <a href="javascript:;">个人</a>
                    </td>
                </tr>
                <tr>
                    <th>面积：</th>
                    <td>
                        <a href="javascript:;" class="pro-cur">不限</a>
                        <a href="javascript:;">10平方</a>
                        <a href="javascript:;">20-40平方</a>
                        <a href="javascript:;">41-60平方</a>
                        <a href="javascript:;">61-80平方</a>
                        <a href="javascript:;">100平方以上</a>
                    </td>
                </tr>
                <tr>
                    <th>房型：</th>
                    <td>
                        <a href="javascript:;" class="pro-cur">不限</a>
                        <a href="javascript:;">一室一厅</a>
                        <a href="javascript:;">两室一厅</a>
                        <a href="javascript:;">三室两厅</a>
                        <a href="javascript:;">一室一厅一卫</a>
                    </td>
                </tr>
            </table>
            <div class="paixu">
                <strong>排序：</strong>
                <a href="<%=basePath%>userController/queryAllHouses4" class="pai-cur">默认</a>
                <a href="<%=basePath%>userController/queryHousesByPrice">价格 &or;</a>
                <a href="<%=basePath%>userController/queryHousesByTime">最新 &or;</a>
            </div>
        </form><!--pro-search/-->
    </div><!--width1190/-->
    <div class="width1190">
        <div class="pro-left" id="index">

            <%--<c:forEach items="${list}" var="houses">--%>
                <%--&lt;%&ndash;<input hidden="hidden" name="houses_id" value="${houses.houses_id}">&ndash;%&gt;--%>
                <%--<dl>--%>
                    <%--<dt><a href="<%=basePath%>/housesController/queryById?houses_id=${houses.houses_id}"><img src="<%=basePath%>images/houses/${houses.houses_image}" style="width: 286px;height: 188px" /></a></dt>--%>
                    <%--<dd>--%>
                        <%--<h3><a href="<%=basePath%>/housesController/queryById?houses_id=${houses.houses_id}">${houses.houses_name}</a></h3>--%>
                        <%--<div class="pro-wei">--%>
                            <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">${houses.area_name}</strong>--%>
                        <%--</div>--%>
                        <%--<div class="pro-fang">${houses.houses_style} ${houses.houses_areas}平 ${houses.houses_toward} 楼层${houses.houses_storey}/30层</div>--%>
                        <%--<div class="pra-fa">发布人：${houses.admin_name}  发布时间：${houses.houses_time}</div>--%>
                    <%--</dd>--%>
                    <%--<div class="price">¥ <strong>${houses.houses_price}</strong><span class="font12">元/月</span></div>--%>
                    <%--<div class="clears"></div>--%>
                <%--</dl>--%>
            <%--</c:forEach>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang2.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang3.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang4.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang5.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang6.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang7.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                    <%--<div class="pro-wei">--%>
                        <%--<img src="<%=basePath%>images/weizhi.png" width="12" height="16" /> <strong class="red">智慧园</strong>--%>
                    <%--</div>--%>
                    <%--<div class="pro-fang">一室一厅 38平 南 楼层中部/6层</div>--%>
                    <%--<div class="pra-fa">发布人：张先生  发布时间：2015-12-03</div>--%>
                <%--</dd>--%>
                <%--<div class="price">¥ <strong>2890</strong><span class="font12">元/月</span></div>--%>
                <%--<div class="clears"></div>--%>
            <%--</dl>--%>
        </div><!--pro-left/-->
        <div class="pro-right">
            <h2 class="right-title">新上房源</h2>
            <div class="right-pro" id="bb">
                <%--<dl>--%>
                    <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang8.jpg" /></a></dt>--%>
                    <%--<dd>--%>
                        <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                        <%--<div class="pro-fang">一室一厅 38平 南</div>--%>
                        <%--<div class="right-price">1100元/月</div>--%>
                    <%--</dd>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang7.jpg" /></a></dt>--%>
                    <%--<dd>--%>
                        <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                        <%--<div class="pro-fang">一室一厅 38平 南</div>--%>
                        <%--<div class="right-price">1100元/月</div>--%>
                    <%--</dd>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<dt><a href="proinfo.jsp"><img src="<%=basePath%>images/fang6.jpg" /></a></dt>--%>
                    <%--<dd>--%>
                        <%--<h3><a href="proinfo.jsp">中装一室一厅，楼层好，采光足，稀缺房源</a></h3>--%>
                        <%--<div class="pro-fang">一室一厅 38平 南</div>--%>
                        <%--<div class="right-price">1100元/月</div>--%>
                    <%--</dd>--%>
                <%--</dl>--%>
            </div><!--right-pro/-->
        </div><!--pro-right/-->
        <div class="clears"></div>
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
