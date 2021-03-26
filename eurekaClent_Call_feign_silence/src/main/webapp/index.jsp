<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/8
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
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
            $(".nav li:eq(0)").addClass("navCur");
        })
    </script>

    <script>
        $(document).ready(function(){

            $.getJSON("<%=basePath%>housesController/queryAllHouses",function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+" <dl>" +
                        "                <dt><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'><img src='<%=basePath%>images/houses/"+data[i].houses_image+"' width='286' height='188' /></a></dt>" +
                        "                <dd>" +
                        "                    <h3><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'></a>"+data[i].houses_name+"</h3>" +
                        "                    <div class='hui'>"+data[i].houses_style+" | "+data[i].houses_areas+"m²| "+data[i].houses_decorate+"</div>" +
                        "                </dd>" +
                        "            </dl>"
                }
                $("#aa").html(str);

            });


            $.getJSON("<%=basePath%>housesController/queryNew",function(data){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+" <dl>" +
                        "                <dt><a href=<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'><img src='<%=basePath%>images/houses/"+data[i].houses_image+"' width='286' height='188' /></a></dt>" +
                        "                <dd>" +
                        "                    <h3><a href='<%=basePath%>housesController/queryById?houses_id="+data[i].houses_id+"'></a>"+data[i].houses_name+"</h3>" +
                        "                    <div class='hui'>"+data[i].houses_style+" | "+data[i].houses_areas+"m²| "+data[i].houses_decorate+"</div>" +
                        "                </dd>" +
                        "            </dl>"
                }
                $("#bb").html(str);

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
<div class="banner" style="background:url(images/ban.jpg) center center no-repeat;"></div>
<div class="content">
    <div class="width1190">
        <h2 class="title">租房 <a href="<%=basePath%>pro_zu.jsp">更多&gt;&gt;</a></h2>
        <div class="index-fang-list" id="aa" style="height: 273px">

            <%--<dl>--%>
            <%--<dt><a href="proinfo.jsp"><img src="images/fang1.jpg" width="286" height="188" /></a></dt>--%>
            <%--<dd>--%>
            <%--<h3><a href="proinfo.jsp"></a>虹桥乐亭</h3>--%>
            <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
            <%--</dd>--%>
            <%--</dl>--%>

            <%--<dl>--%>
            <%--<dt><a href="proinfo.jsp"><img src="images/fang2.jpg" width="286" height="188" /></a></dt>--%>
            <%--<dd>--%>
            <%--<h3><a href="proinfo.jsp"></a>静安豪景</h3>--%>
            <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
            <%--</dd>--%>
            <%--</dl>--%>

            <%--<dl>--%>
            <%--<dt><a href="proinfo.jsp"><img src="images/fang3.jpg" width="286" height="188" /></a></dt>--%>
            <%--<dd>--%>
            <%--<h3><a href="proinfo.jsp"></a>中凯城市之光(静安)</h3>--%>
            <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
            <%--</dd>--%>
            <%--</dl>--%>

            <%--<dl>--%>
            <%--<dt><a href="proinfo.jsp"><img src="images/fang4.jpg" width="286" height="188" /></a></dt>--%>
            <%--<dd>--%>
            <%--<h3><a href="proinfo.jsp"></a>水塘小区</h3>--%>
            <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
            <%--</dd>--%>
            <%--</dl>--%>

            <div class="clears"></div>
        </div><!--index-fang-list/-->


        <h2 class="title">新房 <a href="<%=basePath%>pro_xin.jsp">更多&gt;&gt;</a></h2>
        <div class="index-fang-list" id="bb" style="height: 273px">
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="images/fang5.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp"></a>虹桥乐亭</h3>--%>
                    <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
                <%--</dd>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="images/fang6.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp"></a>静安豪景</h3>--%>
                    <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
                <%--</dd>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="images/fang7.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp"></a>中凯城市之光(静安)</h3>--%>
                    <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
                <%--</dd>--%>
            <%--</dl>--%>
            <%--<dl>--%>
                <%--<dt><a href="proinfo.jsp"><img src="images/fang8.jpg" width="286" height="188" /></a></dt>--%>
                <%--<dd>--%>
                    <%--<h3><a href="proinfo.jsp"></a>水塘小区</h3>--%>
                    <%--<div class="hui">3室2厅2卫 | 147m² | 精装修</div>--%>
                <%--</dd>--%>
            <%--</dl>--%>
            <div class="clears"></div>
        </div><!--index-fang-list/-->

        <h2 class="title">二手房 <a href="<%=basePath%>pro_er.jsp">更多&gt;&gt;</a></h2>
        <div class="index-ershou">
            <div class="in-er-left">
                <a href="<%=basePath%>proinfo.jsp"><img src="<%=basePath%>images/fangt1.jpg" width="380" height="285" /></a>
                <div class="in-er-left-text"><strong class="fl">闵行南方发的撒的发的司法</strong><strong class="fr alignRight">¥2841</strong></div>
            </div><!--in-er-left/-->
            <div class="in-er-right">
                <dl>
                    <dt><a href="<%=basePath%>proinfo.jsp"><img src="<%=basePath%>images/fang1.jpg" width="150" height="115" /></a></dt>
                    <dd>
                        <h3><a href="<%=basePath%>proinfo.jsp">浦东新区张江日水安华苑</a></h3>
                        <div class="in-er-right-text">
                            习近平强调，中方重视发展中南中方重视发展中南“同志加兄弟”的特殊关系。双方要坚持做
                        </div>
                        <div class="price">¥<strong>2890</strong></div>
                    </dd>
                    <div class="clears"></div>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>proinfo.jsp"><img src="<%=basePath%>images/fang3.jpg" width="150" height="115" /></a></dt>
                    <dd>
                        <h3><a href="<%=basePath%>proinfo.jsp">浦东新区张江日水安华苑</a></h3>
                        <div class="in-er-right-text">
                            习近平强调，中方重视发展中南中方重视发展中南“同志加兄弟”的特殊关系。双方要坚持做
                        </div>
                        <div class="price">¥<strong>2890</strong></div>
                    </dd>
                    <div class="clears"></div>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>proinfo.jsp"><img src="<%=basePath%>images/fang8.jpg" width="150" height="115" /></a></dt>
                    <dd>
                        <h3><a href="<%=basePath%>proinfo.jsp">浦东新区张江日水安华苑</a></h3>
                        <div class="in-er-right-text">
                            习近平强调，中方重视发展中南中方重视发展中南“同志加兄弟”的特殊关系。双方要坚持做
                        </div>
                        <div class="price">¥<strong>2890</strong></div>
                    </dd>
                    <div class="clears"></div>
                </dl>
                <dl>
                    <dt><a href="<%=basePath%>proinfo.jsp"><img src="<%=basePath%>images/fang5.jpg" width="150" height="115" /></a></dt>
                    <dd>
                        <h3><a href="proinfo.jsp">浦东新区张江日水安华苑</a></h3>
                        <div class="in-er-right-text">
                            习近平强调，中方重视发展中南中方重视发展中南“同志加兄弟”的特殊关系。双方要坚持做
                        </div>
                        <div class="price">¥<strong>2890</strong></div>
                    </dd>
                    <div class="clears"></div>
                </dl>
                <div class="clears"></div>
            </div><!--in-er-right/-->
            <div class="clears"></div>
        </div><!--index-ershou/-->
    </div><!--width1190/-->
</div><!--content/-->
<div class="xinren">
    <div class="width1190">
        <dl style="background:url(images/icon1.jpg) left center no-repeat;">
            <dt>承诺</dt>
            <dd>真实可信100%真房源<br />链家承诺，假一赔百</dd>
        </dl>
        <dl style="background:url(images/icon2.jpg) left center no-repeat;">
            <dt>权威</dt>
            <dd>独家房源 覆盖全城<br />房源信息最权威覆盖最广</dd>
        </dl>
        <dl style="background:url(images/icon3.jpg) left center no-repeat;">
            <dt>信赖</dt>
            <dd>万名置业顾问 专业服务<br />百万家庭的信赖之选</dd>
        </dl>
        <dl style="background:url(images/icon4.jpg) left center no-repeat;">
            <dt>安全</dt>
            <dd>安心承诺 保驾护航<br />多重风险防范机制 无后顾之忧</dd>
        </dl>
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--xinren/-->
<div class="footer">
    <div class="width1190">
        <div class="fl"><a href="<%=basePath%>index.jsp"><strong>青年社区</strong></a><a href="<%=basePath%>about.jsp">关于我们</a><a href="<%=basePath%>contact.jsp">联系我们</a><a href="<%=basePath%>user.jsp">个人中心</a></div>

        <%--<div class="clears"></div>--%>
    </div><!--width1190/-->
</div><!--footer/-->
</body>
</html>
