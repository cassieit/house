<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/11
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //http://ip:端口/项目名
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>./layui/css/layui.css">

</head>
<body>
<script src="<%=basePath%>./layui/layui.js"></script>

<table class="layui-table" id="pageTable">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th width="200px" height="40px">区域编号</th>
        <th width="200px" height="40px">区域名称</th>
        <th width="300px" height="40px">操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${list}" var="type">

        <tr>
            <td>
                    ${type.type_id}
            </td>
            <td>
                    ${type.type_name}
            </td>


            <td><a href="<%=basePath%>typeController/addType" onclick="" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>增加</a>
            <a href="<%=basePath%>typeController/updateType" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>修改</a>
            <a href="<%=basePath%>typeController/deleteType?type_id=${type.type_id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>删除</a></td>

        </tr>
    </c:forEach>


    </tbody>
</table>
<div align="center" style="padding: 5px; text-align: center; font-size: 15px;" >
    共有 <span id="spanTotalInfor"></span> 条记录&emsp;
    当前第<span id="spanPageNum"></span>/<span id="spanTotalPage"></span>页
</div>
<div align="center" style="text-align: center; font-size: 15px;" >
    <span id="spanFirst" >首页</span>
    <span id="spanPre">上一页</span>
    <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; ">
 第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页
 </span>
    <span id="spanNext">下一页</span>
    <span  id="spanLast">尾页</span>
</div>

<script src="<%=basePath%>js/paging.js"></script>

<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            confirmTrans: function () {
                //配置一个透明的询问框
                layer.msg('禁用后该用户将无法登录<br>是否确认禁用该用户', {
                    time: 20000, //20s后自动关闭
                    btn: ['确认', '取消']
                });
            }

        }

    });
</script>

</body>
</html>