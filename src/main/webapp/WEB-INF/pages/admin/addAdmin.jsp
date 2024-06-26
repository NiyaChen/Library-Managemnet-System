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
    <title>Add Administrator</title>
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
        <label class="layui-form-label required">Username</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" lay-reqtext="Username cannot be empty" placeholder="Please input username" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">Password</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required" lay-reqtext="Password cannot be empty" placeholder="Please input password" value="" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label required">Administrator type</label>
        <div class="layui-input-block">
            <select class="layui-input" name="type" id="type">
                <option value="">Please Select</option>
                <option value="0">General administrator</option>
                <option value="1">Senior administrator</option>
            </select>
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
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            //向后台发送数据提交添加
            $.ajax({
                url:"addAdminSubmit",
                type:"POST",
                data:datas,
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
                        layer.msg(resut.msg);

                    }
                }
            })
            return false;
        });

    });
</script>
</body>
</html>