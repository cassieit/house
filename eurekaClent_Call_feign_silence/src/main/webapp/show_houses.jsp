<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/12
  Time: 14:58
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
<td><a href="<%=basePath%>add_houses.jsp" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>添加</a></td>
<table class="layui-table" id="pageTable">

    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>房源名</th>
        <th>房源图片</th>
        <th>房源区域</th>
        <th>价格</th>
        <th>户型</th>
        <th>面积</th>
        <th>朝向</th>
        <th>楼层</th>
        <th>装修</th>
        <th>地址</th>
        <th>状态</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${list}" var="houses">

        <tr>
            <td>
                    ${houses.houses_name}
            </td>
            <td>
                <img src="<%=basePath%>images/houses/${houses.houses_image}">
            </td>
            <td>
                    ${houses.area_name}
            </td>
            <td>
                    ${houses.houses_price}
            </td>
            <td>
                    ${houses.houses_style}
            </td>
            <td>
                    ${houses.houses_areas}
            </td>
            <td>
                    ${houses.houses_toward}
            </td>
            <td>
                    ${houses.houses_storey}
            </td>
            <td>
                    ${houses.houses_decorate}
            </td>
            <td>
                    ${houses.houses_addr}
            </td>
            <td>
                    ${houses.houses_state}
            </td>
            <c:if test="${houses.houses_state.equals('1')}">
                <td><a href="<%=basePath%>housesController/deleteHouses?houses_id=${houses.houses_id}" onclick="" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>下架</a></td>
            </c:if>
            <c:if test="${houses.houses_state.equals('0')}">
                <td><a href="<%=basePath%>housesController/reHouses?houses_id=${houses.houses_id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>上架</a></td>
            </c:if>
            <td><a href="<%=basePath%>userController/queryHousesByID?houses_id=${houses.houses_id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>更新</a></td>
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

<script type="text/javascript">
    layui.use('layer', function(){
        var $ = layui.jquery,layer = layui.layer; //弹层
        //
        $(document).on('click','#reply',function(){
            var id=$(this).attr("value");
            layer.open({ //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 2,
                title:"回复评价",
                area: ['70%','95%'],//类型：String/Array，默认：'auto'  只有在宽高都定义的时候才不会自适应
                fix: true, //不固定
                maxmin: false,//开启最大化最小化按钮
                shadeClose: true,//点击阴影处可关闭
                shade:0.4,//背景灰度
                skin: 'layui-layer-rim', //加上边框
                content: '../reply.jsp?goods_name=',
                //resize:true
            });

        });

    });

</script>
</body>
</html>