<%--
  Created by IntelliJ IDEA.
  User: 刘 云
  Date: 2019/8/9
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<body>
<script src="../static/layui/layui.js"></script>
<script>
    layui.use(['layer'],function () {
        var layer = layui.layer,$=layui.$;
        $.ajax({
                url:"<%=request.getContextPath()%>/redis/setUser"
                ,contentType:'application/json;charset=utf-8'
                ,dataType:'json'
                ,success:function (data) {
                    console.log(data);
                }
            }
        );
    });
</script>
</body>
</html>
