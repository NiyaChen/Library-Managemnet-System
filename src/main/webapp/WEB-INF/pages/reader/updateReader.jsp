<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Modify Reader Information</title>
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
    <input type="hidden" name="id"   value="${info.id}">
    <div class="layui-form-item">
        <label class="layui-form-label required">Card number</label>
        <div class="layui-input-block">
            <input type="text" name="cardnumber" lay-verify="required"  value="${info.cardnumber}" class="layui-input">
            <tip>Fill in the card number.</tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">Username</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" value="${info.username}"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Real name</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required"value="${info.name}"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Gender</label>
        <div class="layui-input-block">
            <input type="radio" name="sex"  value="man" title="man"  ${"man" eq info.sex ?"checked='checked'":''} />
            <input type="radio" name="sex"  value="women" title="women"  ${"women" eq info.sex ?"checked='checked'":''} />
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label ">Birthday</label>
        <div class="layui-input-block">
            <input type="text" name="birthday" id="date1" autocomplete="off" class="layui-input"
        value="<fmt:formatDate value='${info.birthday}' pattern='yyyy-MM-dd'/>" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Telephone number</label>
        <div class="layui-input-block">
            <input type="text" name="tel"  value="${info.tel}"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Email</label>
        <div class="layui-input-block">
            <input type="text" name="email"  value="${info.email}"  class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label required">Borrowing capacity</label>
        <div class="layui-input-block">
            <input type="number" name="number"  value="${info.number}"  class="layui-input">
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
            elem: '#date1',
            trigger:'click'
        });


        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            //向后台发送数据提交添加
            $.ajax({
                url:"updateReaderSubmit",
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
