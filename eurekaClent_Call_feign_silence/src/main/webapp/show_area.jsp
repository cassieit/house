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

    <c:forEach items="${list}" var="area">

        <tr>
            <td>
                    ${area.area_id}
            </td>
            <td>
                    ${area.area_name}
            </td>


            <td><a href="<%=basePath%>areaController/addArea" id="add" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>增加</a>
            <a href="<%=basePath%>areaController/updateArea" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>修改</a>
            <a href="<%=basePath%>areaController/deleteArea?area_id=${area.area_id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i>删除</a></td>

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
        $(document).on('click','#add',function(){

            layer.open({ //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 2,
                title:"添加区域",
                area: ['70%','95%'],//类型：String/Array，默认：'auto'  只有在宽高都定义的时候才不会自适应
                fix: true, //不固定
                maxmin: false,//开启最大化最小化按钮
                shadeClose: true,//点击阴影处可关闭
                shade:0.4,//背景灰度
                skin: 'layui-layer-rim', //加上边框
                content: 'addArea.jsp',
                btn: ['添加', '取消'],                  //按钮，可定义多个，btn2，btn3....获取回调，第一个按钮为 yes 获取回调
                yes: function (index, layero) {         //请求回调，按钮【添加】的回调
                    var iframeWin = window[layero.find('iframe')[0]['name']];   //当前页获得 iframe页的窗口对象，执行iframe页的方法：
                    iframeWin.userlayuiadd();           //调用子页面的方法，得到子页面返回的值
                    //layer.msg('添加成功');
                    layer.close(index);                 //关闭窗口（需要手动）
                }, btn2: function (index, layero) {     //请求回调，按钮【取消】的回调  return false 开启该代码可禁止点击该按钮关闭
                }, cancel: function () {                //请求回调，右上角关闭执行 return false 开启该代码可禁止点击该按钮关闭
                }, success: function (layero, index) {  //请求回调，打开窗口时执行
                }, end: function () {                   //请求回调，窗口销毁时执行
                    //window.location.href='/user/pageAll';
                    location.reload();                  //窗口销毁时刷新主页面数据
                }
            });

        });

    });

</script>

</body>
</html>