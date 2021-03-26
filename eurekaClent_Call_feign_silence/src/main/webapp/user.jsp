<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/11
  Time: 10:39
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
                <h3 class="vipTitle">个人中心</h3>
                <dl>
                    <dt class="vipIcon3">账户设置</dt>
                    <dd>
                        <a href="<%=basePath%>user.jsp" class="vipNavCur">我的资料</a>
                        <a href="<%=basePath%>user_pwd.jsp">账户密码设置</a>
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
            <%--<h3 class="vipright-title">修改头像</h3>--%>
            <%--<form action="#" method="get">--%>
                <%--<dl class="vip-touxiang">--%>
                    <%--<dt><img src="<%=basePath%>images/tx.jpg" width="100" height="100" /></dt>--%>
                    <%--<dd>--%>
                        <%--<h3><strong>点击选择文件上传头像</strong></h3>--%>
                        <%--<div class="sctx"><input type="file" /><a href="javascript:;">上传</a></div>--%>
                        <%--<p>图片格式：GIF、JPG、JPEG、PNG ，最适合尺寸100*100像素</p>--%>
                    <%--</dd>--%>
                    <%--<div class="clearfix"></div>--%>
                <%--</dl><!--vip-touxiang/-->--%>
            <%--</form>--%>
            <h3 class="vipright-title">修改资料</h3>
            <form action="<%=basePath%>/userController/updateuser">
                <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
                <input type="hidden" name="user_pwd" value="${sessionScope.loginUser.user_pwd}">
                <input type="hidden" id="user_name" value="${sessionScope.loginUser.user_name}">
                <input type="hidden" id="user_tel" value="${sessionScope.loginUser.user_tel}">
                <input type="hidden" id="user_card" value="${sessionScope.loginUser.user_card}">
            <table class="grinfo">
                <tbody>
                <tr>
                    <th><span class="red">*</span>手机号：</th>
                    <td>
                        <strong><input id="tel" class="inp inw" type="text" name="user_tel" onblur="checktel()" value="${sessionScope.loginUser.user_tel}"></strong>
                        <span id="showerror4"></span>
                    </td>

                </tr>
                <tr>
                    <th><span class="red">*</span> 用户名：</th>
                    <td>
                        <input class="inp inw" type="text" id="title" name="user_name" onblur="checkname()" value="${sessionScope.loginUser.user_name}" maxlength="14">
                        <span id="showerror1"></span>
                    </td>

                </tr>
                <tr>
                    <th><span class="red">*</span> 性 &nbsp; &nbsp;别：</th>
                    <c:if test="${sessionScope.loginUser.user_sex=='男'}">
                        <td>
                            <input type="radio" value="女"  name="user_sex">
                            <label for="rbSex1">女</label>
                            <input type="radio" value="男" name="user_sex" checked="checked">
                            <label for="rbSex2">男</label>
                        </td>
                    </c:if>
                    <c:if test="${sessionScope.loginUser.user_sex=='女'}">
                        <td>
                            <input type="radio" value="女" id="rbSex1" name="user_sex" checked="checked">
                            <label for="rbSex1">女</label>
                            <input type="radio" value="男" id="rbSex2" name="user_sex">
                            <label for="rbSex2">男</label>
                        </td>
                    </c:if>
                </tr>

                <tr>
                    <th><span class="red">*</span> 身份证：</th>
                    <td>
                        <input class="inp inw" type="text" id="qq" name="user_card" onblur="checkcard()" value="${sessionScope.loginUser.user_card}" maxlength="14">
                        <span id="showerror5"></span>
                    </td>

                </tr>

                <tr>
                    <th valign="top">个性签名：</th>
                    <td>
                        <textarea id="sign" class="grtextarea"></textarea>
                        <br>
                        <span class="fgrey">(128字符以内)</span>
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <td colspan="2">
                        <label class="butt" id="butt">
                            <input type="submit" class="member_mod_buttom" onclick="return checkall()" value="完成修改" />
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

    var flag1=false;  //验证用户是否可以被注册
    var flag2=false;  //验证电话号码是否已存在
    var flag3=false;  //验证身份证是否已存在

    function checkname(){
        var op=document.getElementById("title").value;
        var op1=document.getElementById("user_name").value;
        //判断输入框是否有值

        if(op==null||op==""){
            //document.getElementById("showerror1").innerHTML="<img src=\"images/fail.png\"/> 账号不能为空|账号已被注册"
            $("#showerror1").html("<img src=\"<%=basePath%>images/fail.png\"/> 用户名不能为空");
            return false;
        }else if(op==op1) {
            $("#showerror1").html("");
            return true;
        }else{
            //通过ajax验证输入用户是否已被注册
            $.get("<%=basePath%>userController/isRegister",{user_name:op},function(data){
                if(data=='noregister'){
                    //可以使用
                    $("#showerror1").html("<img src=\"<%=basePath%>images/success.png\"/>");
                    flag1=true;
                }else{
                    //不能注册
                    $("#showerror1").html("<img src=\"<%=basePath%>images/fail.png\"/>用户名已被注册");
                    flag1=false;
                }

            });
            return true;
        }


    }


    function checktel(){
        var op=document.getElementById("tel").value;
        var op1=document.getElementById("user_tel").value;
        var regPartton=/1[3-8]+\d{9}/;


        if(op==null||op==''){
            $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码不能为空")
            return false;
        }else if (!regPartton.test(op)){
            $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码格式不正确")
            return false;
        }else if(op==op1) {
            $("#showerror4").html("");
            return true;
        } else{
            //通过ajax验证输入电话号码是否已存在
            $.get("<%=basePath%>userController/isTel",{user_tel:op},function(data){
                if(data=='notel'){
                    //可以使用
                    $("#showerror4").html("<img src=\"<%=basePath%>images/success.png\"/>");
                    flag2=true;
                }else{
                    //不能注册
                    $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码已被注册");
                    flag2=false;
                }

            });
            return true;
        }
    }


    function checkcard(){
        var op=document.getElementById("qq").value;
        var op1=document.getElementById("user_card").value;
        //var reg=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;

        //判断输入框是否有值
         if(op==null||op==""){
            $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证不能为空");
            return false;
            // }else if (reg.test(op)==false){
            //     $("#showerror5").jsp("<img src=\"images/fail.png\"/> 身份证格式不正确");
            //     return false;
         }else if(op==op1) {
             $("#showerror5").html("");
             return true;
         }else {

            //通过ajax验证输入身份证是否已存在
            $.get("<%=basePath%>userController/isCard",{user_card:op},function(data){
                if(data=='nocard'){
                    //可以使用
                    $("#showerror5").html("<img src=\"<%=basePath%>images/success.png\"/>");
                    flag3=true;
                }else{
                    //不能注册
                    $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/>身份证已被注册");
                    flag3=false;
                }

            });
            return true;
        }


    }



    function checkall(){

        return (checkname()&&flag1)||(checktel()&&flag2)||(checkcard()&&flag3);
    }

</script>
</html>

