<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/29
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../static/layui/css/layui.css">
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script src="../static/layui/layui.js"></script>
<script type="text/html" id="toolbar">
    <input class="layui-btn layui-btn-normal layui-btn-radius layui-btn-xs" lay-event="del" value="删除" />
</script>
<script type="text/html" id="toolbarDemo">
    <input class="layui-btn layui-btn-primary layui-btn-radius" lay-event="add" value="添加" />
</script>
<script type="text/html" id="bar1">
    {{# if(d.gender==0){ }}
    女
    {{# }else{ }}
    男
    {{# } }}
</script>
<script>
    layui.use(['form','table'],function(){
        var form = layui.form,table=layui.table,$=layui.$,layer=layui.layer;
        $.ajax({
            url:'<%=request.getContextPath()%>/user'
            ,type:'GET'
            ,dataType:'json'
            ,contentType:'application/json'
            ,success:function(data){
                table.render({
                    elem: '#test'
                    ,data:data
                    ,cols: [[
                        {type:'checkbox'}
                        ,{field:'userId',title: 'ID', sort: true}
                        ,{field:'userName',title: '姓名'}
                        ,{field:'gender',title:'性别',toolbar:'#bar1'}
                        ,{field:'loginName',title: '用户名'}
                        ,{field:'password',title: '密码'}
                        ,{fixed:'right', title: '操作', minWidth: 30,toolbar:'#toolbar'}
                    ]]
                    ,toolbar:'#toolbarDemo'
                    ,page: true
                });
            }
        });
        table.on('tool(test)', function(obj) {
            var data = obj.data;
            console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url:'<%=request.getContextPath()%>/user'
                        ,type:'DELETE'
                        ,data:{'userId':data.userId}
                        ,success:function(data){
                            if(data){
                                layer.msg("删除成功",{icon:1});
                                obj.del();
                                layer.close(index);
                            }else{
                                layer.msg("删除失败",{icon:2});
                                layer.close(index);
                            }
                        }
                    });
                });
            }
        });
        table.on('toolbar(test)', function(obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    layer.open({
                        type: 2,
                        title: '添加用户',
                        shadeClose: true,
                        shade: false,
                        maxmin: true, //开启最大化最小化按钮
                        area: ['400px', '400px'],
                        content: '../jsp/userAdd.jsp'
                    });
                    break;
            };
        });
    });
</script>
</body>
</html>
