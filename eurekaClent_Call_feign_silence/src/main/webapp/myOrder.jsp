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
	 $(".nav li:eq(5)").addClass("navCur");
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
   <div class="fl">您好${sessionScope.loginUser.user_name} ，欢迎来到青年社区！</div>
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
   <div class="vip-left">
       <div class="vipNav">
        <h3 class="vipTitle">会员中心</h3>
        <dl>
         <dt class="vipIcon3">账户设置</dt>
          <dd>
           <a href="<%=basePath%>user.jsp">我的资料</a>
           <a href="<%=basePath%>user_pwd.jsp">账户密码设置</a>
          </dd>
         <dt class="vipIcon1">订单中心</dt>
          <dd>
           <a href="" class="vipNavCur">我的订单</a>
          </dd>
        </dl>
       </div><!--vipNav/-->
    </div><!--vip-left/-->
    <div class="vip-right">
     <h3 class="vipright-title">订单列表</h3>
     <div class="jingjiren" >
      <dl><div class="dizhi" style="margin-left: 120px" ><dd> 订单信息</dd><dd style="margin-left: 130px">订单金额</dd><dd style="margin-left: 100px">订单状态</dd><dd style="margin-left: 120px">操作</dd></div></dl>
      <dl>
       <c:forEach items="${orderInfos}" var="orders">
       <dt><img src="<%=basePath%>images/houses/${orders.houses_image}" /></dt>
       <dd>
        <div class="dizhi" style="width: 150px"> ${orders.houses_style} - ${orders.houses_decorate}</div>
       </dd>
       <dd>
        <div class="dizhi" style="width: 130px">¥<strong> ${orders.houses_price}</strong>元/月</div>
       </dd>
       <dd>
        <div class="dizhi">
         <c:if test="${orders.orders_state=='2'}"><a href="#" style="width: 50px">已撤销</a><a href="<%=basePath%>http://localhost:8892/orderController/deleteByid?orders_id=${orders.orders_id}" style="margin-left: 100px">删除</a></c:if>
         <c:if test="${orders.orders_state=='0'}"> <a href="#" style="width: 50px">待付款</a><a href="<%=basePath%>http://localhost:8892/orderController/updateOrder?orders_id=${orders.orders_id}&orders_state=1" style="margin-left: 100px">付款</a><a href="<%=basePath%>http://localhost:8892/orderController/updateOrder?orders_id=${orders.orders_id}&orders_state=2" style="margin-left: 20px">撤销</a></c:if>
         <c:if test="${orders.orders_state=='1'}"><a href="#" style="width: 50px">已付款</a></c:if>
        </div>
       </dd>

       <div class="clearfix"></div>
      </dl>
</c:forEach>

     </div><!--jingjiren/-->
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
</html>
