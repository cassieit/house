<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/15
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //http://ip:端口/项目名
%>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <title>Title</title>
</head>
<body>
<script>

    function changepic() {

        var reads= new FileReader();

        f=document.getElementById('file').files[0];

        reads.readAsDataURL(f);

        reads.onload=function (e) {

            document.getElementById('show').src=this.result;

        };

    }



</script>

<form action="<%=basePath%>housesController/addHouses" method="post">
    <table class="layui-table">

        <tr><td>发布人:</td><td><input type="hidden" name="admin_id" value="${loginAdmin.admin_id}"><input name="admin_name" value="${loginAdmin.admin_name}" readonly="readonly"></td><td></td><td></td></tr>
        <tr><td>区域名称:</td><td><select name="area_id">
            <option value="1" selected>西城区</option>
            <option value="2">东城区</option>
            <option value="3">朝阳区</option>
            <option value="4">海淀区</option>
            <option value="5">昌平区</option>
            <option value="6">顺义区</option>
            <option value="7">丰台区</option>
            <option value="8">怀柔区</option>
            <option value="9">密云区</option>
        </select></td>
            <td>房源类型:</td><td><select name="type_id" >
                <option value="1" selected>长租</option>
                <option value="2">短租</option>
                <option value="3">合租</option>
                <option value="4">个人</option>
            </select></td></tr>
        <%--<tr></tr>--%>
        <tr><td>房源名称:</td><td><input type="text" name="houses_name" ></td><td>房源售价:</td><td><input type="text" name="houses_price" ></td></tr>
        <%--<tr></tr>--%>
        <tr> <td>房源户型:</td><td><input type="text" name="houses_style" ></td><td>房源面积:</td><td><input type="text" name="houses_areas" ></td></tr>
        <%--<tr> </tr>--%>
        <tr> <td>房源朝向:</td><td><input type="text" name="houses_toward" ></td><td>房源楼层:</td><td><input type="text"  name="houses_storey"  ></td></tr>
        <%--<tr></tr>--%>
        <tr><td>房源装修:</td><td><input type="text" name="houses_decorate" ></td><td>房源地址:</td><td><input type="text" name="houses_addr" ></td></tr>
        <%--<tr></tr>--%>
        <tr> <td>房源详情:</td><td><input type="text" name="houses_info" ></td> <td>房源状态:</td><td><input type="text" name="houses_state" ></td></tr>

        <%--<tr></tr>--%>
        <tr > <td>房源图片: </td>
            <td><form action="" enctype="multipart/form-data">

                <input id="file" name="houses_image" class="filepath" onchange="changepic(this)" type="file"><br>

                <img src="" id="show" width="200px" >

            </form></td><td></td><td></td>
        </tr>

        <button  type="submit" class="layui-btn">添加</button>

    </table>
</form>



</body>
</html>

