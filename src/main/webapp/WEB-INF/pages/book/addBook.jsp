<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Add Book</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">Book name</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="The book name cannot be empty" placeholder="Please input the book name" value="" class="layui-input">
            <tip>Fill in the name of book.</tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">ISBN</label>
        <div class="layui-input-block">
            <input type="text" name="isbn" lay-verify="required" lay-reqtext="The ISBN cannot be empty" placeholder="Please input ISBN" value="" class="layui-input">
            <tip>Fill in the ISBN of book。</tip>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Book type</label>
        <div class="layui-input-block">
            <select name="typeId" id="typeId" lay-verify="required">
                <option value="">Select</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Author</label>
        <div class="layui-input-block">
            <input type="text" name="author" lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Publisher</label>
        <div class="layui-input-block">
            <input type="text" name="publish" lay-verify="required"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Language</label>
        <div class="layui-input-block">
            <input type="text" name="language"   class="layui-input">
        </div>
    </div>

<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label required">Price</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="number" name="price"   class="layui-input">--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">validation date</label>
        <div class="layui-input-block">
            <input type="text" name="pubDate" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">Introduction</label>
        <div class="layui-input-block">
            <textarea name="introduction" class="layui-textarea" placeholder="Please input the introduction information"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">Confirm save</button>
        </div>
    </div>
</div>
<script src="<%=basePath%>lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate=layui.laydate,
            $ = layui.$;

        //日期
        laydate.render({
            elem: '#date',
            trigger:'click'
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

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            //向后台发送数据提交添加
            $.ajax({
                url:"addBookSubmit",
                type:"POST",
                // data:datas,
                contentType:'application/json',
                data:JSON.stringify(datas),
                success:function(result){
                    if(result.code==0){//如果成功
                        layer.msg('Add successful',{
                            icon:6,
                            time:500
                        },function(){
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    }else{
                         layer.msg("Add failed");
                    }
                }
            })
            return false;
        });




    });
</script>
</body>
</html>
