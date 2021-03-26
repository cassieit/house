<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/9
  Time: 13:59
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

        var flag1=false;  //验证电话号码是否已存在



        function checkpwd(){
            var op=document.getElementById("password").value;
            if(op==null||op==''||op.length<6){
                $("#showerror2").html("<img src=\"<%=basePath%>images/fail.png\"/>密码必须大于等于6位")
                return false;
            }else{
                $("#showerror2").html("<img src=\"<%=basePath%>images/success.png\"/>");
                return true;
            }
        }

        function recheckpwd(){
            var op1=document.getElementById("confirm_password").value;
            var op2=document.getElementById("password").value;
            if(op1.length<6&&op2.length<6){
            // if(op1!=null&&op1!=''&&op2!=null&&op2!=''&&op1.length<6&&op2.length<6){
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


        function checktel(){
            var op=document.getElementById("tel").value;
            var regPartton=/1[3-8]+\d{9}/;
            if(op==null||op==''){
                $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码不能为空")
                return false;
            }else if (!regPartton.test(op)){
                $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码格式不正确")
                return false;
            } else{
                //通过ajax验证输入电话号码是否已存在
                $.get("userController/isTel",{user_tel:op},function(data){
                    if(data=='tel'){
                        //可以使用
                        $("#showerror4").html("<img src=\"<%=basePath%>images/success.png\"/>");
                        flag1=true;

                    }else{
                        //不能
                        $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码不存在");
                        flag1=false;
                    }

                });
                return true;
            }
        }



        function checkall(){

            return flag1&&checkpwd()&&recheckpwd()&&checktel();
        }

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
    <style>
        #tel,#idcard,#yzm{border:1px solid #ccc;width:300px;height:46px;text-indent:10px;}
    </style>
</head>

<body>
<div class="header">
    <div class="width1190">
        <div class="fl">您好，欢迎来到青年社区！</div>
        <div class="fr">
            <a href="<%=basePath%>login.jsp">登录</a> |
            <a href="<%=basePath%>reg.jsp">注册</a> |
        <%--<div class="fl">您好${sessionScope.loginUser.user_name}，欢迎来到邻居大妈！</div>--%>
        <%--<div class="fr">--%>
            <%--<c:if test="${sessionScope.loginUser==null}">  <a href="login.jsp">登录</a></c:if>--%>
            <%--<c:if test="${sessionScope.loginUser!=null}"> <a href="login.jsp">注销</a></c:if>--%>
            <%--|--%>
            <%--<a href="reg.jsp">注册</a> |--%>
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
            <form id="signupForm" method="post" action="<%=basePath%>userController/repassword" class="zcform">


                <p class="clearfix">
                    <label class="one" style="width: 100px" for="password"><img src="<%=basePath%>images/must.png">设置密码：</label>
                    <input id="password" name="user_pwd" type="password" onblur="checkpwd()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
                </p>
                <p style="padding-left: 90px" id="showerror2"></p>
                <p class="clearfix">
                    <label class="one" style="width: 100px" for="confirm_password"><img src="<%=basePath%>images/must.png">确认密码：</label>
                    <input id="confirm_password" name="confirm_password" type="password"  onblur="recheckpwd()" class="{required:true,equalTo:'#password'}" value placeholder="请再次输入密码" />
                </p>
                <p style="padding-left: 90px" id="showerror3"></p>



                <p class="clearfix">
                    <label class="one" style="width: 100px" for="tel"><img src="<%=basePath%>images/must.png">电话：</label>
                    <input id="tel" name="user_tel" type="text" onblur="checktel()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入手机号"/>
                    <input type="button" onclick="" style="margin-top: 5px" value="获取验证码"/>
                </p>
                <p style="padding-left: 90px" id="showerror4"></p>

                <p class="clearfix">
                    <label class="one" style="width: 100px" ><img src="<%=basePath%>images/must.png">验证码：</label>
                    <input id="yzm" name="user_yzm" type="text" onblur="checkyzm()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入验证码"/>

                </p>
                <p style="padding-left: 90px" id="showerror5"></p>


                <p class="clearfix" style="margin-top: 10px"><input class="submit" type="submit" onclick="return checkall()" value="重置密码"/></p>
            </form>
            <div class="reg-logo-right">
                <h3>如果您已有账号，请</h3>
                <a href="<%=basePath%>login.jsp" class="logo-a">立即登录</a>
            </div><!--reg-logo-right/-->
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
