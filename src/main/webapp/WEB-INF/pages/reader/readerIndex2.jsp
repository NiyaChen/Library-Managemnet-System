<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reader Management</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">



        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="update">Change password</a>
        </script>

    </div>
</div>
<script src="<%=basePath%>lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath%>queryReaderAll2',//查询图书数据
            toolbar: '#toolbarDemo',
            // defaultToolbar: ['filter', 'exports', 'print', {
            //     title: '提示',
            //     layEvent: 'LAYTABLE_TIPS',
            //     icon: 'layui-icon-tips'
            // }],
            cols: [[
                {type: "checkbox", width: 50},
/*                {field: 'id', width: 100, title: 'ID', sort: true},*/
                {field: 'cardnumber', width: 130, title: 'Library card'},
                {field: 'username', width: 140, title: 'Username'},
                {field: 'name', width: 140, title: 'Real name'},
                {field: 'sex', width: 80, title: 'Gender'},
                {field: 'tel', width: 120, title: 'Telephone'},
                {field: 'number', width: 100, title: 'Capacity'},
                {title: 'Operate', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line',
            id:'testReload'
        });



        /**
         * tool操作栏监听事件
         */
        table.on('tool(currentTableFilter)', function (obj) {
            var data=obj.data;
          if (obj.event === 'update') {  // 监听添加操作
                var index = layer.open({
                    title: 'modify password',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['60%', '60%'],
                    content: '<%=basePath%>queryReaderById?id=' + data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });

            }
        });
    });
</script>

</body>
</html>
