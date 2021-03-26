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
        #tel,#idcard{border:1px solid #ccc;width:300px;height:46px;text-indent:10px;}
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
            <form id="signupForm" method="post" action="<%=basePath%>userController/register" class="zcform">
                <p class="clearfix">
                    <label class="one" style="width: 100px" for="agent"><img src="<%=basePath%>images/must.png">用户名：</label>
                    <input id="agent" name="user_name" type="text" onblur="checkname()" class="required" value placeholder="请输入您的用户名" />
                </p>
                <p style="padding-left: 90px" id="showerror1"></p>

                <p class="clearfix">
                    <label class="one" style="width: 100px" for="password"><img src="<%=basePath%>images/must.png">登录密码：</label>
                    <input id="password" name="user_pwd" type="password" onblur="checkpwd()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
                </p>
                <p style="padding-left: 90px" id="showerror2"></p>
                <p class="clearfix">
                    <label class="one" style="width: 100px" for="confirm_password"><img src="<%=basePath%>images/must.png">确认密码：</label>
                    <input id="confirm_password" name="confirm_password" type="password"  onblur="recheckpwd()" class="{required:true,equalTo:'#password'}" value placeholder="请再次输入密码" />
                </p>
                <p style="padding-left: 90px" id="showerror3"></p>

                <p class="clearfix">
                    <label class="one" style="width: 100px"><img src="<%=basePath%>images/must.png">性别：</label>


                <td>
                    <input type="radio" value="女" id="rbSex1" name="user_sex" checked="checked" style="margin-top: 15px">
                    <label for="rbSex1" style="color: black">女</label>
                    <input type="radio" value="男" id="rbSex2" name="user_sex" style="margin-top: 15px">
                    <label for="rbSex2" style="color: black">男</label>
                </td>
                </p>

                <p class="clearfix">
                    <label class="one" style="width: 100px" for="tel"><img src="<%=basePath%>images/must.png">电话：</label>
                    <input id="tel" name="user_tel" type="text" onblur="checktel()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入手电话号码"/>
                </p>
                <p style="padding-left: 90px" id="showerror4"></p>
                <p class="clearfix">
                    <label class="one" style="width: 100px" for="idcard"><img src="<%=basePath%>images/must.png">身份证：</label>
                    <input id="idcard" name="user_card" type="text" onblur="checkcard()" class="{required:true,rangelength:[8,20],}" value placeholder="请输入身份证号码" />
                </p>
                <p style="padding-left: 90px" id="showerror5"></p>


                <p class="clearfix" style="margin-top: 10px"><input class="submit" type="submit" onclick="return checkall()" value="立即注册"/></p>
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
<script>

    var flag1=false;  //验证用户是否可以被注册
    var flag2=false;  //验证电话号码是否已存在
    var flag3=false;  //验证身份证是否已存在

    function checkname(){
        var op=document.getElementById("agent");
        //判断输入框是否有值
        if(op.value==null||op.value==""){
            //document.getElementById("showerror1").innerHTML="<img src=\"images/fail.png\"/> 账号不能为空|账号已被注册"
            $("#showerror1").html("<img src=\"<%=basePath%>images/fail.png\"/> 用户名不能为空");
            return false;
        }else{
            //通过ajax验证输入用户是否已被注册
            $.get("<%=basePath%>userController/isRegister",{user_name:op.value},function(data){
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


    function checktel(){
        var op=document.getElementById("tel").value;
        // var regPartton=/1[3-8]+\d{9}/;
        if(op==null||op==''){
            $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码不能为空")
            return false;
        }else if (!(/^13\d{9}$/g.test(op)) || !(/^15[0-35-9]\d{8}$/g.test(op)) || !(/^18[0-9]\d{8}$/g.test(op)) || (/^14[457]\d{8}$/g.test(op))){
            $("#showerror4").html("<img src=\"<%=basePath%>images/fail.png\"/>电话号码格式不正确")
            return false;
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


    function getArea() {
        var area = {
            11 :"北京",
            12 :"天津",
            13 :"河北",
            14 :"山西",
            15 :"内蒙古",
            21 :"辽宁",
            22 :"吉林",
            23 :"黑龙江",
            31 :"上海",
            32 :"江苏",
            33 :"浙江",
            34 :"安徽",
            35 :"福建",
            36 :"江西",
            37 :"山东",
            41 :"河南",
            42 :"湖北",
            43 :"湖南",
            44 :"广东",
            45 :"广西",
            46 :"海南",
            50 :"重庆",
            51 :"四川",
            52 :"贵州",
            53 :"云南",
            54 :"西藏",
            61 :"陕西",
            62 :"甘肃",
            63 :"青海",
            64 :"宁夏",
            65 :"新疆",
            71 :"台湾",
            81 :"香港",
            82 :"澳门",
            91 :"国外"
        };
        return area;
    }


    function checkcard(){
        var op=document.getElementById("idcard");
        //判断输入框是否有值
        if(op.value==null||op.value=="") {
            $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证不能为空");
            return false;
            // }else if (reg.test(op)==false){
            //     $("#showerror5").html("<img src=\"images/fail.png\"/> 身份证格式不正确");
            //     return false;
            // }else if(op.value!=null) {
        }else {
            // 检查大陆身份证号合法性
            var card = op.value;
            // var Errors=new Array(
            //     "验证通过!",
            //     "身份证号码位数不对!",
            //     "身份证号码出生日期超出范围或含有非法字符!",
            //     "身份证号码校验错误!",
            //     "身份证地区非法!");

            // 得到地区集合数组
            var area = getArea();
            var card_array = card.split("");
            // s为1位的性别代码，奇数代表男性，偶数代表女性

            var ereg, JYM, S, Y;
            // 验证身份证地区是否合法
            if (area[card.substring(0, 2)] == null) {
                $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证地区非法!");
                return false;
            }
            switch (card.length) {
                // 15位身份证验证
                case 15:
                    if ((parseInt(card.substr(6, 2)) + 1900) % 4 == 0
                        || ((parseInt(card.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(card
                            .substr(6, 2)) + 1900) % 4 == 0)) {
                        ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2] [0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9])) [0-9]{3}$/;// 测试出生日期的合法性
                    } else {
                        ereg = /^[1-9][0-9]{5}[0-9]{2} ((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]| [1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
                    }
                    if (ereg.test(card)) {
                        $.get("<%=basePath%>userController/isCard", {user_card: op.value}, function (data) {
                            if (data == 'nocard') {
                                //可以使用
                                $("#showerror5").html("<img src=\"<%=basePath%>images/success.png\"/>");
                                flag3 = true;
                            } else {
                                //不能注册
                                $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/>身份证已被注册");
                                flag3 = false;
                            }

                        });
                        return true;
                    } else {
                        $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证号码出生日期超出范围或含有非法字符!");// alert(Errors[2]);
                        return false;
                    }
                    break;
                // 18位身份证验证
                case 18:
                    // 18位身份号码检测
                    // 出生日期的合法性检查
                    // 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|
                    // (04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
                    // 平年月日:
                    // ((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
                    var currentTime = new Date();

                    if (parseInt(card.substr(6, 4)) >= currentTime.getFullYear()) {
                        $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证号年份不合法,请检查输入!");//alert("身份证号年份不合法,请检查输入!");
                        return false;
                    }
                    if (parseInt(card.substr(6, 4)) % 4 == 0
                        || (parseInt(card.substr(6, 4)) % 100 == 0 && parseInt(card
                            .substr(6, 4)) % 4 == 0)) {
                        // /^[1-9][0-9]{5}19[0-9]{2}
                        ereg = /^[1-9][0-9]{5}[1-2][0|9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
                    } else {
                        ereg = /^[1-9][0-9]{5}[1-2][0|9][0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
                    }
                    if (ereg.test(card)) {// 测试出生日期的合法性
                        // 计算校验位
                        S = (parseInt(card_array[0]) + parseInt(card_array[10])) * 7
                            + (parseInt(card_array[1]) + parseInt(card_array[11]))
                            * 9
                            + (parseInt(card_array[2]) + parseInt(card_array[12]))
                            * 10
                            + (parseInt(card_array[3]) + parseInt(card_array[13]))
                            * 5
                            + (parseInt(card_array[4]) + parseInt(card_array[14]))
                            * 8
                            + (parseInt(card_array[5]) + parseInt(card_array[15]))
                            * 4
                            + (parseInt(card_array[6]) + parseInt(card_array[16]))
                            * 2 + parseInt(card_array[7]) * 1
                            + parseInt(card_array[8]) * 6 + parseInt(card_array[9])
                            * 3;
                        Y = S % 11;
                        M = "F";
                        JYM = "10X98765432";
                        M = JYM.substr(Y, 1);// 判断校验位

                        if (M == card_array[17].toUpperCase()) {
                            $.get("<%=basePath%>userController/isCard", {user_card: op.value}, function (data) {
                                if (data == 'nocard') {
                                    //可以使用
                                    $("#showerror5").html("<img src=\"<%=basePath%>images/success.png\"/>");
                                    flag3 = true;
                                } else {
                                    //不能注册
                                    $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/>身份证已被注册");
                                    flag3 = false;
                                }

                            });
                            return true; // 检测ID的校验位
                        } else {
                            $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证号码校验错误!");//alert(Errors[3]);
                            return false;
                        }
                    } else {
                        $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证号码出生日期超出范围或含有非法字符!");//alert(Errors[2]);
                        return false;
                    }
                    break;
                    break;
            }
            $("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/> 身份证号码位数不对!");//alert(Errors[1]);
            return false;
        }
        <%--} else{--%>
            <%--//通过ajax验证输入身份证是否已存在--%>
            <%--$.get("<%=basePath%>userController/isCard",{user_card:op.value},function(data){--%>
                <%--if(data=='nocard'){--%>
                    <%--//可以使用--%>
                    <%--$("#showerror5").html("<img src=\"<%=basePath%>images/success.png\"/>");--%>
                    <%--flag3=true;--%>
                <%--}else{--%>
                    <%--//不能注册--%>
                    <%--$("#showerror5").html("<img src=\"<%=basePath%>images/fail.png\"/>身份证已被注册");--%>
                    <%--flag3=false;--%>
                <%--}--%>

            <%--});--%>
            <%--return true;--%>
        <%--}--%>


    }

    // function checkyan(){
    //     var op1=document.getElementById("yanzheng").value;
    //
    //     //通过ajax验证  验证码是否匹配
    //     $.get("userController/checkyan",{yanzheng:op1},function(data){
    //         if(data=='success'){
    //             //验证码匹配
    //             $("#yanshow").html("");
    //             flag3=true;
    //         }else{
    //             //验证码不匹配
    //             $("#yanshow").html("<img src=\"images/fail.png\" width=\"12\" height=\"12\" />验证码不匹配");
    //             flag3=false;
    //         }
    //
    //     });
    //
    // }



    function checkall(){

        return checkname()&&flag1&&checkpwd()&&recheckpwd()&&checktel()&&flag2&&checkcard()&&flag3;
    }

</script>

</body>
</html>
