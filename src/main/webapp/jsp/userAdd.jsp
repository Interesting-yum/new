<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/29
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<body>
    <form class="layui-form" lay-filter="layform" method="post">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="text" name="password" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="gender" value="1" title="男" checked="">
                <input type="radio" name="gender" value="0" title="女">
                <input type="radio" name="gender" value="" title="禁用" disabled="">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="submit">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

<script src="../static/layui/layui.js"></script>
<script>
    layui.use(['form','layer'],function(){
        var layer=layui.layer,form=layui.form,$=layui.$;

        form.render();

        form.on('submit(submit)',function(data){
           $.ajax({
               url:'<%=request.getContextPath()%>/user'
               ,data:JSON.stringify(data.field)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,success:function(data){
                   if(data){
                       layer.msg("添加成功",{icon:1});
                       setTimeout(function () {
                           var index = parent.layer.getFrameIndex(window.name);
                           parent.layer.close(index);
                           parent.window.location.reload();
                       },800);
                   }
               }
           });
           return false;
        });
    });
</script>
</body>
</html>
