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
    <title>借阅管理</title>
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
                    Library card
                    <div class="layui-inline">
                        <input class="layui-input" name="cardnumber" id="cardnumber" autocomplete="off">
                    </div>
                    Book name
                    <div class="layui-inline">
                        <input class="layui-input" name="name" id="name" autocomplete="off">
                    </div>
                    Return type
                    <div class="layui-inline">
                        <select class="layui-input" name="type" id="type">
                            <option value="">Please select</option>
                            <option value="0">Normal</option>
                            <option value="1">Delay</option>
                            <option value="2">Damaged</option>
                            <option value="3">Lose</option>
                        </select>
                    </div>
                   Book type
                    <div class="layui-inline">
                        <select class="layui-input" name="status" id="status">
                            <option value="">Please select</option>
                            <option value="0">Available</option>
                            <option value="1">Not Available</option>
                        </select>
                    </div>
                    <button class="layui-btn" data-type="reload">Query</button>
                </div>
            </div>
        </div>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> borrow </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="back"> return </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> delete </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            {{# if(d.backDate==null){ }}
                <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">abnormal return</a>
                <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">Delete</a>
            {{# }else{ }}
               <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">delete</a>
            {{# } }}
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
            url: '<%=basePath%>lendListAll',//查询借阅图书记录
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: 'notice',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
             {field: 'id', width: 80, title: 'ID', sort: true},
                {templet: '<div><a href="javascript:void(0)" style="color:#00b7ee" lay-event="bookInfoEvent">{{d.bookInfo.name}}</a></div>',
                    width: 150, title: 'Book name'},
                {templet: '<div>{{d.reader.cardnumber}}</div>', width: 120, title: 'Library card'},
                {templet: '<div><a href="javascript:void(0)" style="color:#00b7ee" lay-event="readerInfoEvent">{{d.reader.name}}</a></div>',
                    width: 100, title: 'Reader'},
                // {templet: '<div>{{d.reader.name}}</div>', width: 80, title: '借阅人'},
                {templet:"<div>{{layui.util.toDateString(d.lendDate,'yyyy-MM-dd HH:mm:ss')}}</div>", width: 160, title: 'Borrow time'},
                {field: 'backDate', width: 160, title: 'Return time'},
                {title:"Return type",minWidth: 160,templet:function(res){
                      if(res.type=='0'){
                          return '<span class="layui-badge">Normal</span>'
                      }else if(res.type=='1'){
                          return '<span class="layui-badge">Delay</span>'

                      }else if(res.type=='2'){
                          return '<span class="layui-badge">Damaged</span>'

                          return '<span class="layui-badge">Lose</span>'

                      }else{
                          return '<span class="layui-badge">on borrowing</span>'

                      }
                    }},
                {title: 'operate', minWidth: 200, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: {
                page: 'page',
                count: 'count'
            },
            skin: 'line',
            id:'testReload'
        });


        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name').val();
                var cardnumber = $('#cardnumber').val();
                var type = $('#type').val();
                var status = $('#status').val();
                console.log(name)
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        type:type,
                        name: name,
                        cardnumber:cardnumber,
                        status:status
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
                    title: 'Abnormal return',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '<%=basePath%>excBackBook?id='+data.id+"&bookId="+data.bookId,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                layer.confirm('Are you sure you want to delete it?', function (index) {
                    //调用删除功能
                    //获取记录信息的id集合
                    var ids=getCheackId(data);//借阅记录的id集合
                    var bookIds=getCheackBookId(data);//图书的id集合
                    deleteInfoByIds(ids,bookIds,index);
                    layer.close(index);
                });
            }else if( obj.event === 'bookInfoEvent') {//书的借阅线
                  layer.msg("Lending time for books")
                  //获取书的id
                  var bid=data.bookId;
                  queryLookBookList("book",bid);
            }else{//读者借阅线
                //获取读者的id
                var rid=data.readerId;
                queryLookBookList("user",rid);
            }
        });

        /**
         * 借阅线打开内容
         */
        function queryLookBookList(flag,id){
            var index = layer.open({
                title: 'Lending timeline',
                type: 2,
                shade: 0.2,
                maxmin:true,
                shadeClose: true,
                area: ['60%', '60%'],
                content: '<%=basePath%>queryLookBookList?id='+id+"&flag="+flag,
            });
            $(window).on("resize", function () {
                layer.full(index);
            });
        }




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
         * 获取选中记录的中图书id集合*/
        function getCheackBookId(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].bookId);
            }
            //拼接id
            return arr.join(",");
        };

        /**
         * 提交删除功能
         */
        function deleteInfoByIds(ids ,bookIds,index){
            //向后台发送请求
            $.ajax({
                url: "deleteLendListByIds",
                type: "POST",
                data: {ids:ids, bookIds:bookIds},
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
         * 提交还书功能
         */
        function backBooksByIds(ids ,bookIds,index){
            //向后台发送请求
            $.ajax({
                url: "backLendListByIds",
                type: "POST",
                data: {ids: ids,bookIds:bookIds},
                success: function (result) {
                    if (result.code == 0) {//如果成功
                        layer.msg('Return book successful', {
                            icon: 6,
                            time: 500
                        }, function () {
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        });
                    } else {
                        layer.msg("Return book failed");
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
                    title: 'borrow book management ',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '<%=basePath%>addLendList',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            }else if (obj.event === 'back'){//还书操作
                //获取选中的记录信息
                //获取选中的记录信息
                var checkStatus=table.checkStatus(obj.config.id);
                debugger;
                var data=checkStatus.data;

                if(data.length==0){//如果没有选中信息
                    layer.msg("Please select the record information you want to borrow and return the book");
                }else{
                    //获取记录信息的id集合
                    var ids=getCheackId(data);//借阅记录的id集合
                    var bookIds=getCheackBookId(data);//图书的id集合
                    layer.confirm('Are you sure want to return the book', function (index) {
                        //调用还书功能
                        backBooksByIds(ids,bookIds,index);
                        layer.close(index);
                    });
                }
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
                    layer.msg("Select the record information that you want to delete");
                }else{
                    //获取记录信息的id集合
                    var ids=getCheackId(data);//借阅记录的id集合
                    var bookIds=getCheackBookId(data);//图书的id集合
                    layer.confirm('Are you sure you want to delete it?', function (index) {
                        //调用删除功能
                        deleteInfoByIds(ids,bookIds,index);
                        layer.close(index);
                    });
                }
            }
        });

    });
</script>

</body>
</html>
