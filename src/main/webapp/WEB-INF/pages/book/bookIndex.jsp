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
    <title>Book Management</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="layuimini-main">
            <div class="demoTable">
                <div class="layui-form-item layui-form ">
                    book name
                    <div class="layui-inline">
                        <input class="layui-input" name="name" id="name" autocomplete="off">
                    </div>
                    ISBN
                    <div class="layui-inline">
                        <input class="layui-input" name="isbn" id="isbn" autocomplete="off">
                    </div>
                    book category
                    <div class="layui-inline">
                        <select name="typeId" id="typeId" lay-verify="required">
                            <option value="">Please Select</option>
                        </select>
                    </div>
                    <button class="layui-btn" data-type="reload">Query</button>
                    <%--<button class="layui-btn" lay-submit data-type="reload"  lay-filter="queryBook">高级查询</button>--%>
                </div>
            </div>
        </div>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> add </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> delete </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">edit</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">delete</a>
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
            url: '<%=basePath%>bookAll',//查询图书数据
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: 'note',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 100, title: 'ID', sort: true},
                {field: 'isbn', width: 80, title: 'ISBN'},
                //获取对象中的属性 对象
                {templet:'<div>{{d.classInfo.name}}</div>', width: 150, title: 'Book type'},
                {field: 'name', width: 150, title: 'Book name'},
                {field: 'author', width: 100, title: 'Author'},
                {field: 'language', width: 120, title: 'Language'},
                {title: 'operation', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line',
            id:'testReload'
        });

        //动态获取图书类型的数据
        $.get("findAllList",{},function (data) {
            var list=data;
            var select=document.getElementById("typeId");
            if(list!=null|| list.size()>0){
                for(var c in list){
                    var option=document.createElement("option");
                    option.setAttribute("value",list[c].id);
                    option.innerText=list[c].name;
                    select.appendChild(option);
                }
            }
            form.render('select');
        },"json")


        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name').val();
                var isbn= $('#isbn').val();
                var typeId= $('#typeId').val();
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name:name,
                        isbn:isbn,
                        typeId:typeId,
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        /**
         * tool操作栏监听事件
         */
        table.on('tool(currentTableFilter)', function (obj) {
            var data=obj.data;
            if (obj.event === 'edit') {  // 监听添加操作
                var index = layer.open({
                    title: 'Modify Book Type',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '<%=basePath%>queryBookInfoById?id='+data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                layer.confirm('Are you sure you want to delete it?', function (index) {
                    //调用删除功能
                    deleteInfoByIds(data.id,index);
                    layer.close(index);
                });
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        /**
         * 获取选中记录的id信息
         */
        function getCheackId(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].id);
            }
            //拼接id
            return arr.join(",");
        };


        /**
         * 提交删除功能
         */
        function deleteInfoByIds(ids ,index){
            //向后台发送请求
            $.ajax({
                url: "deleteBookByIds",
                type: "POST",
                data: {ids: ids},
                success: function (result) {
                    if (result.code == 0) {//如果成功
                        layer.msg('Delete successful', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    } else {
                        layer.msg("Delete failed");
                    }
                }
            })
        };

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加图书',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '<%=basePath%>addBook',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {
                /*
                  1、提示内容，必须删除大于0条
                  2、获取要删除记录的id信息
                  3、提交删除功能 ajax
                */
                //获取选中的记录信息
                var checkStatus=table.checkStatus(obj.config.id);
                var data=checkStatus.data;
                if(data.length==0){//如果没有选中信息
                    layer.msg("Please select the record information to be deleted");
                }else{
                    //获取记录信息的id集合
                    var ids=getCheackId(data);
                    layer.confirm('Are you sure you want to delete it?', function (index) {
                        //调用删除功能
                        deleteInfoByIds(ids,index);
                        layer.close(index);
                    });
                }
            }
        });

    });
</script>

</body>
</html>
